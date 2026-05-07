<?php
header('Content-Type: application/json');

// Получаем параметры из URL
$mangaId = $_GET['id'] ?? null;

if (!$mangaId) {
    echo json_encode(['error' => 'Missing manga_id parameter']);
    exit;
}

try {
    // Получаем список глав из базы данных
    $pdo = new PDO("mysql:host=localhost;dbname=manga;charset=utf8", "root", "");
    $stmt = $pdo->prepare("SELECT * FROM chapters WHERE manga_id = ? ORDER BY chapter_number ASC");
    $stmt->execute([$mangaId]);
    $chapters = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Для каждой главы добавляем информацию о страницах
    foreach ($chapters as &$chapter) {
        $directory = "uploads/" . $mangaId . "/" . $chapter['chapter_number'] . "/";
        $pages = [];
        
        if (is_dir($directory)) {
            $files = scandir($directory);
            if ($files !== false) {
                foreach ($files as $file) {
                    $fileInfo = pathinfo($file);
                    if (isset($fileInfo['extension']) && in_array(strtolower($fileInfo['extension']), ['jpg', 'jpeg', 'png', 'webp'])) {
                        $pages[] = $directory . $file;
                    }
                }
                // Сортируем по имени файла
                sort($pages);
            }
        }
        
        $chapter['pages'] = $pages;
        $chapter['page_count'] = count($pages);
    }
    
    echo json_encode(['chapters' => $chapters, 'success' => true]);
    
} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage(), 'success' => false]);
}
?>