<?php
/**
 * MangaVerse - PHP API dla filtrowania mangi
 * 
 * Parametry GET:
 * - genre: filtruj po gatunku (np. "Akcja", "Romans")
 * - type: filtruj po typie (Манга, Манхва, Маньхуа)
 * - status: filtruj po statusie (Wydawane, Zakończone, Zawieszone)
 * - year_from: filtruj od roku (np. 2020)
 * - year_to: filtruj do roku (np. 2024)
 * - rating: minimalna ocena (np. 4.5)
 * - search: wyszukiwanie po tytule
 * 
 * Przykład użycia:
 * api/manga.php?genre=Akcja&year_from=2020&rating=4.5
 */
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

// База данных манги
$mangaDatabase = [
    [
        'id' => 'angel-next-door',
        'title' => 'Anioł z sąsiedztwa',
        'cover' => 'gg.webp',
        'type' => 'Манга',
        'year' => '2019',
        'status' => 'Wydawane',
        'ageRating' => '13+',
        'genres' => 'Romans, Szkolne, Codzienne życie',
        'rating' => '4.9',
        'tags' => 'romans,szkolne,codzienne',
        'description' => 'Mahiru Shiina jest doskonałą uczennicą, którą wszyscy nazywają "Aniołem". Pewnego deszczowego dnia spotyka swojego sąsiada Amane Fujimiya...'
    ],
    [
        'id' => 'high-school-dxd',
        'title' => 'High School DxD',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx86234-nCHWcWvxMoIH.png',
        'type' => 'Манга',
        'year' => '2016',
        'status' => 'Zakończone',
        'ageRating' => '18+',
        'genres' => 'Akcja, Fantastyka, Romans',
        'rating' => '4.8',
        'tags' => 'akcja,fantastyka,romans,demony',
        'description' => 'Issei Hyodo to zwyczajny uczeń liceum, który zostaje zabity przez dziewczynę i odrodzony jako demon.'
    ],
    [
        'id' => 'chainsaw-man',
        'title' => 'Chainsaw Man',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx105778-Uh1A2e7m9JkZ.png',
        'type' => 'Манга',
        'year' => '2018',
        'status' => 'Wydawane',
        'ageRating' => '18+',
        'genres' => 'Akcja, Horror, Czarna komedia',
        'rating' => '4.9',
        'tags' => 'akcja,horror,czarna_komedia,diabel',
        'description' => 'Denji to młody chłopak, który zostaje zabity, a potem ożywiony jako połączenie człowieka i demona piły łańcuchowej.'
    ],
   
    [
        'id' => 'dandadan',
        'title' => 'Dandadan',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx132052-bRgxUI5POtT9.png',
        'type' => 'Манга',
        'year' => '2021',
        'status' => 'Wydawane',
        'ageRating' => '16+',
        'genres' => 'Akcja, Science Fiction, Romans',
        'rating' => '4.8',
        'tags' => 'akcja,science_fiction,romans,duchy',
        'description' => 'Momo Ayase i Ken Takakura zakładają się o istnienie duchów i kosmitów, co prowadzi do szalonej przygody.'
    ],
   
    [
        'id' => 'jujutsu-kaisen',
        'title' => 'Jujutsu Kaisen',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx102801-67fPPSiF1qG3.jpg',
        'type' => 'Манга',
        'year' => '2018',
        'status' => 'Zakończone',
        'ageRating' => '16+',
        'genres' => 'Akcja, Fantastyka, Przygoda',
        'rating' => '4.8',
        'tags' => 'akcja,fantastyka,przygoda,czarownicy',
        'description' => 'Yuji Itadori przyjmuje klątwę Ryoumen Sukuna, aby uratować swoich przyjaciół, i zostaje wplątany w świat jujutsu.'
    ],
    [
        'id' => 'spy-family',
        'title' => 'Spy x Family',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx114106-TBBP8ihjSj1C.png',
        'type' => 'Манга',
        'year' => '2019',
        'status' => 'Wydawane',
        'ageRating' => '13+',
        'genres' => 'Akcja, Komedia, Szkolne',
        'rating' => '4.9',
        'tags' => 'akcja,komedia,szkolne,szpieg',
        'description' => 'Szpieg Twilight musi stworzyć fałszywą rodzinę, aby wykonać misję. Jego "córka" jest telepatą, a "żona" zabójczynią.'
    ],
    [
        'id' => 'attack-on-titan',
        'title' => 'Attack on Titan',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/nx23390-1vRPtJFqPJgW.jpg',
        'type' => 'Манга',
        'year' => '2009',
        'status' => 'Zakończone',
        'ageRating' => '16+',
        'genres' => 'Akcja, Dramat, Postapokalipsa',
        'rating' => '4.9',
        'tags' => 'akcja,dramat,postapokalipsa,titany',
        'description' => 'Ludzkość żyje w miastach otoczonych murami, chroniąc się przed Tytanami - olbrzymimi istotami ludojadnymi.'
    ],
    // Dodatkowe tytuły z oryginalnego katalogu
    [
        'id' => 'solo-leveling',
        'title' => 'Solo Leveling',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx121586-MjPDeH6PeJ5P.png',
        'type' => 'Манхва',
        'year' => '2018',
        'status' => 'Zakończone',
        'ageRating' => '16+',
        'genres' => 'Akcja, Fantastyka, Przygoda',
        'rating' => '4.9',
        'tags' => 'akcja,fantastyka,przygoda,poziomy',
        'description' => 'Sung Jin-Woo, najsłabszy łowca, zyskuje możliwość levelowania i staje się najpotężniejszym graczem.'
    ],
    [
        'id' => 'blue-lock',
        'title' => 'Blue Lock',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx128522-yfSl6ZtJBSgT.png',
        'type' => 'Манга',
        'year' => '2018',
        'status' => 'Wydawane',
        'ageRating' => '13+',
        'genres' => 'Sport, Akcja, Psychologiczne',
        'rating' => '4.6',
        'tags' => 'sport,akcja,piłka_nożna,rywalizacja',
        'description' => 'Program Blue Lock ma stworzyć najlepszego napastnika w historii piłki nożnej poprzez brutalną konkurencję.'
    ],
    [
        'id' => 'vinland-saga',
        'title' => 'Vinland Saga',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/nx34541-1VxfE9N39U05.jpg',
        'type' => 'Манга',
        'year' => '2005',
        'status' => 'Wydawane',
        'ageRating' => '16+',
        'genres' => 'Akcja, Przygoda, Historyczne',
        'rating' => '4.8',
        'tags' => 'akcja,przygoda,wikingowie,historia',
        'description' => 'Thorfinn, syn wielkiego wikinga, pragnie zemsty na zabójcy ojca, ale jego droga prowadzi ku zrozumieniu.'
    ],
    [
        'id' => 'one-punch-man',
        'title' => 'One Punch Man',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx74347-8hKD1xX9nhq4.png',
        'type' => 'Манга',
        'year' => '2012',
        'status' => 'Wydawane',
        'ageRating' => '14+',
        'genres' => 'Akcja, Komedia, Superbohaterowie',
        'rating' => '4.8',
        'tags' => 'akcja,komedia,superbohaterowie,saitama',
        'description' => 'Saitama jest tak silny, że pokonuje każdego jednym ciosem. Szuka wyzwania w świecie pełnym potworów.'
    ],
    [
        'id' => 'demon-slayer',
        'title' => 'Demon Slayer',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx87216-qyc2I5z6zKfw.jpg',
        'type' => 'Манга',
        'year' => '2016',
        'status' => 'Zakończone',
        'ageRating' => '14+',
        'genres' => 'Akcja, Fantastyka, Sztuki walki',
        'rating' => '4.9',
        'tags' => 'akcja,fantastyka,demony,tanjiro',
        'description' => 'Tanjiro Kamado zostaje demonem po ataku na jego rodzinę i wyrusza w podróż, by odnaleźć lekarstwo.'
    ],
    [
        'id' => 'horimiya',
        'title' => 'Horimiya',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx36213-uZ2S6VLqLFsC.png',
        'type' => 'Манга',
        'year' => '2011',
        'status' => 'Zakończone',
        'ageRating' => '13+',
        'genres' => 'Romans, Szkolne, Komedia',
        'rating' => '4.7',
        'tags' => 'romans,szkolne,komedia,hory',
        'description' => 'Hori i Miyamura odkrywają swoje tajne życia poza szkołą i zakochują się w sobie nawzajem.'
    ],
    [
        'id' => 'komi-san',
        'title' => 'Komi-san wa Komyushou desu',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/nx99031-pC7K60M5CKqT.jpg',
        'type' => 'Манга',
        'year' => '2016',
        'status' => 'Zakończone',
        'ageRating' => '13+',
        'genres' => 'Komedia, Szkolne, Romans',
        'rating' => '4.6',
        'tags' => 'komedia,szkolne,romans,społeczność',
        'description' => 'Komi-san, dziewczyna z zaburzeniami komunikacyjnymi, chce zdobyć 100 przyjaciół z pomocą Tadano.'
    ],
    [
        'id' => 'mashle',
        'title' => 'Mashle',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx120683-h2wW8Wsqkv9X.png',
        'type' => 'Манга',
        'year' => '2020',
        'status' => 'Zakończone',
        'ageRating' => '13+',
        'genres' => 'Akcja, Komedia, Magia',
        'rating' => '4.5',
        'tags' => 'akcja,komedia,magia,muscles',
        'description' => 'Mash, bez magicznych zdolności w świecie magii, używa fizycznej siły, by zostać najlepszym czarodziejem.'
    ],
    [
        'id' => 'beginning-after-end',
        'title' => 'The Beginning After The End',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx139413-9UeRzCqM2ybB.png',
        'type' => 'Манхва',
        'year' => '2017',
        'status' => 'Wydawane',
        'ageRating' => '13+',
        'genres' => 'Fantastyka, Przygoda, Akcja',
        'rating' => '4.7',
        'tags' => 'fantastyka,przygoda,akcja,reinkarnacja',
        'description' => 'Król Grey reinkarnuje się w magicznym świecie i rozpoczyna nowe życie pełne przygód.'
    ],
    [
        'id' => 'your-lie-april',
        'title' => 'Your Lie in April',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx55003-TOHulzj4aX8q.png',
        'type' => 'Манга',
        'year' => '2011',
        'status' => 'Zakończone',
        'ageRating' => '13+',
        'genres' => 'Romans, Dramat, Muzyka',
        'rating' => '4.9',
        'tags' => 'romans,dramat,muzyka,fortepian',
        'description' => 'Pianista Kousei traci słuch, ale dziewczyna o imieniu Kaori pomaga mu znów pokochać muzykę.'
    ],
    [
        'id' => 'pigsty',
        'title' => 'Pigsty',
        'cover' => 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx167095-AW5xaqnWCfZ8.png',
        'type' => 'Манхва',
        'year' => '2022',
        'status' => 'Wydawane',
        'ageRating' => '18+',
        'genres' => 'Horror, Thriller, Psychologiczne',
        'rating' => '4.5',
        'tags' => 'horror,thriller,psychologiczne,przemoc',
        'description' => 'Mroczna historia o brutalnym świecie, gdzie człowiek zmienia się w zwierzę.'
    ]
];

// Получение параметров фильтрации
$genre = isset($_GET['genre']) ? $_GET['genre'] : '';
$type = isset($_GET['type']) ? $_GET['type'] : '';
$status = isset($_GET['status']) ? $_GET['status'] : '';
$yearFrom = isset($_GET['year_from']) ? intval($_GET['year_from']) : 0;
$yearTo = isset($_GET['year_to']) ? intval($_GET['year_to']) : 9999;
$rating = isset($_GET['rating']) ? floatval($_GET['rating']) : 0;
$search = isset($_GET['search']) ? strtolower($_GET['search']) : '';

// Фильтрация
$filtered = array_filter($mangaDatabase, function($manga) use ($genre, $type, $status, $yearFrom, $yearTo, $rating, $search) {
    // Фильтр по жанру
    if ($genre && strpos(strtolower($manga['genres']), strtolower($genre)) === false && 
        strpos($manga['tags'], strtolower($genre)) === false) {
        return false;
    }
    
    // Фильтр по типу
    if ($type && $manga['type'] !== $type) {
        return false;
    }
    
    // Фильтр по статусу
    if ($status && $manga['status'] !== $status) {
        return false;
    }
    
    // Фильтр по году
    $mangaYear = intval($manga['year']);
    if ($yearFrom && $mangaYear < $yearFrom) {
        return false;
    }
    if ($yearTo && $mangaYear > $yearTo) {
        return false;
    }
    
    // Фильтр по рейтингу
    if ($rating && floatval($manga['rating']) < $rating) {
        return false;
    }
    
    // Поиск по названию
    if ($search && strpos(strtolower($manga['title']), $search) === false) {
        return false;
    }
    
    return true;
});

// Получение уникальных значений для фильтров (для populate фильтров)
$uniqueYears = array_unique(array_map(function($m) { return $m['year']; }, $mangaDatabase));
rsort($uniqueYears);

$uniqueGenres = [];
foreach ($mangaDatabase as $manga) {
    $genres = explode(', ', $manga['genres']);
    foreach ($genres as $g) {
        $uniqueGenres[trim($g)] = true;
    }
}
$uniqueGenres = array_keys($uniqueGenres);
sort($uniqueGenres);

// Ответ
$response = [
    'success' => true,
    'count' => count($filtered),
    'data' => array_values($filtered),
    'filters' => [
        'years' => array_values($uniqueYears),
        'genres' => $uniqueGenres,
        'types' => ['Манга', 'Манхва', 'Маньхуа'],
        'statuses' => ['Wydawane', 'Zakończone', 'Zawieszone'],
        'ratings' => [5, 4.5, 4, 3.5, 3]
    ],
    'applied_filters' => [
        'genre' => $genre,
        'type' => $type,
        'status' => $status,
        'year_from' => $yearFrom,
        'year_to' => $yearTo,
        'rating' => $rating,
        'search' => $search
    ]
];

echo json_encode($response, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
?>
