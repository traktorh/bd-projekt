<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Czytnik mangi - MANGAVERSE</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="reader.css">
</head>
<body>
    <header class="reader-header">
        <div class="reader-nav">
            <div class="reader-nav-left">
                 <a class="logo" href="index.html">MANGA<span>VERSE</span></a>
                <span class="manga-title-reader">angel-next-door</span>
            </div>
            <div class="reader-nav-center">
                <button class="chapter-nav-btn" onclick="previousChapter()">←</button>
                <span class="chapter-info" onclick="toggleChapterList()">tom 1 rozdział 1</span>
                <button class="chapter-nav-btn" onclick="nextChapter()">→</button>
                <div id="chapterListDropdown" class="chapter-list-dropdown">
                    <!-- Chapter list will be dynamically loaded here -->
                </div>
            </div>
        </div>
    </header>

    <main class="reader-main">
        <!-- Kontener dla dynamicznej ładowania obrazów rozdziałów -->
        <div id="staticImagesContainer" style="margin: 0 auto; max-width: 800px; background: #0a0a0a;">
            <!-- Obrazy będą ładowane dynamicznie -->
        </div>
    </main>

    <!-- Overlay dla animacji przejścia między rozdziałami (nie używany) -->
    <!-- <div id="chapterTransitionOverlay" class="chapter-transition-overlay">
        <div class="transition-content">
           
           
        </div>
    </div> -->

  

   
    <script>
        // Настройки
        let currentChapter = 1;
        let totalChapters = 39; // Вы можете изменить это значение
        let mangaId = 1;
        
        // Ссылки на изображения для каждой главы
        // Просто вставляйте URL картинок в массив для каждой главы
        const chapterImages = {
            1: [
             'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/1.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/3.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/4.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/11.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/12.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/13.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-1/14.webp',
            ],
            2: [
              'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-2/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-2/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-2/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-2/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-2/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-2/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-2/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-2/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-2/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-2/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-2/11.webp',
        
     
            ],
            3: [
              'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/11.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-3/13.webp',
            ],
            4: [
                  'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-4/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-4/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-4/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-4/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-4/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-4/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-4/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-4/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-4/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-4/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-4/11.webp',
       
            ],
            
            5: [
               'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-5/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-5/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-5/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-5/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-5/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-5/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-5/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-5/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-5/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-5/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-5/11.webp',
       
            ],
            6: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-6/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-6/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-6/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-6/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-6/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-6/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-6/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-6/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-6/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-6/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-6/11.webp',
            ],
            7: [
                  'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/11.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-7/13.webp',
            ],
             8: [
                  'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/11.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/13.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/14.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-8/15.webp',
            ],
             9: [
                  'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/11.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-9/13.webp',
            ],
             10: [
                 'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/11.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-10/13.webp',
            ],
             11: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-11/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-11/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-11/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-11/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-11/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-11/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-11/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-11/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-11/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-11/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-11/11.webp',
            ],
             12: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-12/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-12/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-12/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-12/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-12/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-12/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-12/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-12/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-12/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-12/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-12/11.webp',
            ],
             13: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-13/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-13/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-13/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-13/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-13/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-13/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-13/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-13/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-13/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-13/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-13/11.webp',
            ],
             14: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-14/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-14/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-14/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-14/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-14/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-14/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-14/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-14/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-14/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-14/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-14/11.webp',
            ],
             15: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-15/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-15/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-15/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-15/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-15/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-15/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-15/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-15/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-15/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-15/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-15/11.webp',
            ],
             16: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/11.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-16/13.webp',
            ],
             17: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/11.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-17/13.webp', 
            ],
             18: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/11.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/13.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/14.webp', 
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-18/15.webp',
            ],
            
             19: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/11.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-19/13.webp', 
            ],
             20: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/11.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-20/13.webp', 
            ],
             21: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-21/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-21/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-21/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-21/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-21/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-21/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-21/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-21/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-21/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-21/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-21/11.webp',
         
            ],
             22: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-22/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-22/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-22/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-22/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-22/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-22/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-22/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-22/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-22/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-22/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-22/11.webp',
         
            ],
             23: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-23/13.webp',
        
            ],
             24: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-24/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-24/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-24/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-24/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-24/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-24/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-24/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-24/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-24/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-24/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-24/11.webp',
            ],
             25: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/13.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/14.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-25/15.webp',
            ],
             26: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-26/13.webp',
            ],
             27: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-27/13.webp',
            ],
             28: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/13.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/14.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-28/15.webp',
       
            ],
             29: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-29/13.webp',
            ],
             30: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/13.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-30/14.webp',
        
            ],
             31: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-31/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-31/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-31/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-31/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-31/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-31/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-31/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-31/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-31/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-31/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-31/11.webp',
         
            ],
             32: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-32/13.webp',
            ],
             33: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/10.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/12.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-33/13.webp',
            ],
             34: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/10.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/12.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-34/13.webp',
            ],
             35: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-35/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-35/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-35/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-35/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-35/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-35/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-35/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-35/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-35/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-35/10.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-35/11.webp',
         
            ],
             36: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-36/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-36/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-36/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-36/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-36/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-36/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-36/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-36/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-36/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-36/10.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-36/11.webp',
         
            ],
             37: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/10.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/12.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-37/13.webp',
         
            ],
             38: [
                'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/10.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/12.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-38/13.webp',
         
            ],
             39: [
               'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/1.webp',
                   'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/2.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/3.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/4.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/5.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/6.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/7.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/8.webp',
        'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/9.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/10.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/11.webp',
         'https://pic.readkakegurui.com/file/sancdn/the-angel-next-door-spoils-me-rotten-after-the-rain/chapter-39/12.webp',
            ],
            
        };  
        
        let isLoading = false;
        let lastClickTime = 0;
        const CLICK_DELAY = 100; // Уменьшил задержку между кликами

        // Функции для работы с историей чтения
        function getReadingHistory() {
            const history = localStorage.getItem('mangaReadingHistory');
            return history ? JSON.parse(history) : {};
        }

        function saveChapterAsRead(chapterNum) {
            const history = getReadingHistory();
            const mangaKey = `manga_${mangaId}`;
            
            if (!history[mangaKey]) {
                history[mangaKey] = [];
            }
            
            if (!history[mangaKey].includes(chapterNum)) {
                history[mangaKey].push(chapterNum);
                history[mangaKey].sort((a, b) => a - b); // Сортируем по порядку
                localStorage.setItem('mangaReadingHistory', JSON.stringify(history));
            }
        }

        function isChapterRead(chapterNum) {
            const history = getReadingHistory();
            const mangaKey = `manga_${mangaId}`;
            return history[mangaKey] && history[mangaKey].includes(chapterNum);
        }

        // Функция загрузки главы с URL изображениями
        function loadChapter(chapterNum) {
            if (isLoading) return;
            isLoading = true;
            
            // Обновляем информацию о главе в header
            document.querySelector('.chapter-info').textContent = `tom 1 rozdział ${chapterNum}`;
            
            const container = document.getElementById('staticImagesContainer');
            
            // Простая анимация исчезновения
            container.style.opacity = '0';
            
            setTimeout(() => {
                // Очищаем контейнер
                container.innerHTML = '';
                
                // Получаем массив URL для текущей главы
                const imageUrls = chapterImages[chapterNum] || [];
                
                // Если нет ссылок для этой главы
                if (imageUrls.length === 0) {
                    container.innerHTML = `
                        <div style="text-align: center; padding: 50px; color: #fff;">
                            <p>Rozdział ${chapterNum} nie ma jeszcze dodanych obrazów</p>
                            <p style="font-size: 14px; color: #888; margin-top: 10px;">
                                Dodaj linki do zdjęć w kodzie (chapterImages[${chapterNum}])
                            </p>
                        </div>`;
                    container.style.opacity = '1';
                    isLoading = false;
                    return;
                }
                
                // Создаем контейнер для изображений
                const imagesContainer = document.createElement('div');
                imagesContainer.style.display = 'flex';
                imagesContainer.style.flexDirection = 'column';
                imagesContainer.style.alignItems = 'center';
                
                let loadedImages = 0;
                let hasAnyImage = false;
                
                // Загружаем все изображения по URL
                imageUrls.forEach((imageUrl, index) => {
                    const img = document.createElement('img');
                    img.src = imageUrl;
                    img.style.cssText = 'max-width: 100%; width: 700px; display: block; margin-bottom: 10px; background: #1a1a1a;';
                    img.alt = `Strona ${index + 1}`;
                    
                    // Обработка успешной загрузки
                    img.onload = function() {
                        loadedImages++;
                        hasAnyImage = true;
                        if (loadedImages === 1) {
                            // Первое изображение загружено - показываем контейнер
                            container.appendChild(imagesContainer);
                            // Простая анимация появления
                            container.style.opacity = '1';
                            // Сохраняем главу в историю чтения
                            saveChapterAsRead(chapterNum);
                            isLoading = false;
                        }
                    };
                    
                    // Обработка ошибки загрузки
                    img.onerror = function() {
                        loadedImages++;
                        console.error(`Nie udało się załadować: ${imageUrl}`);
                        // Создаем placeholder dla niezaładowanego obrazu
                        const errorDiv = document.createElement('div');
                        errorDiv.style.cssText = 'width: 700px; height: 1000px; background: #1a1a1a; display: flex; align-items: center; justify-content: center; color: #666; margin-bottom: 10px;';
                        errorDiv.innerHTML = `<span>Błąd ładowania strony ${index + 1}</span>`;
                        imagesContainer.appendChild(errorDiv);
                        
                        if (loadedImages === 1 && !hasAnyImage) {
                            container.appendChild(imagesContainer);
                            container.style.opacity = '1';
                            isLoading = false;
                        }
                    };
                    
                    imagesContainer.appendChild(img);
                });
            }, 200); // Короткая задержка для анимации
        }

        // Функции навигации между главами
        function previousChapter() {
            const currentTime = Date.now();
            if (currentTime - lastClickTime < CLICK_DELAY) return;
            lastClickTime = currentTime;
            
            if (currentChapter > 1 && !isLoading) {
                currentChapter--;
                loadChapter(currentChapter);
                updateURL();
                updateCurrentChapterHighlight();
            }
        }

        function nextChapter() {
            const currentTime = Date.now();
            if (currentTime - lastClickTime < CLICK_DELAY) return;
            lastClickTime = currentTime;
            
            if (currentChapter < totalChapters && !isLoading) {
                currentChapter++;
                loadChapter(currentChapter);
                updateURL();
                updateCurrentChapterHighlight();
            }
        }
        
            // Обновление URL параметров
        function updateURL() {
            const url = new URL(window.location);
            url.searchParams.set('chapter', currentChapter);
            window.history.replaceState({}, '', url);
        }

        // Функция переключения выпадающего списка глав
        function toggleChapterList() {
            const dropdown = document.getElementById('chapterListDropdown');
            const isVisible = dropdown.classList.contains('show');
            
            if (isVisible) {
                dropdown.classList.remove('show');
            } else {
                // Генерируем список только если он пустой
                if (dropdown.children.length === 0) {
                    generateChapterList();
                }
                dropdown.classList.add('show');
            }
        }
        
        // Функция генерации списка глав
        function generateChapterList() {
            const dropdown = document.getElementById('chapterListDropdown');
            
            for (let i = 1; i <= totalChapters; i++) {
                const chapterItem = document.createElement('div');
                chapterItem.className = 'chapter-list-item';
                
                // Проверяем, прочитана ли глава
                if (isChapterRead(i)) {
                    chapterItem.classList.add('read');
                }
                
                chapterItem.textContent = `Tom 1 Rozdział ${i}`;
                chapterItem.onclick = function() {
                    const currentTime = Date.now();
                    if (currentTime - lastClickTime < CLICK_DELAY) return;
                    lastClickTime = currentTime;
                    
                    if (!isLoading) {
                        currentChapter = i;
                        loadChapter(currentChapter);
                        updateURL();
                        dropdown.classList.remove('show');
                        
                        // Aktualizujemy podświetlenie bieżącego rozdziału
                        document.querySelectorAll('.chapter-list-item').forEach(item => {
                            item.classList.remove('current');
                        });
                        this.classList.add('current');
                    }
                };
                dropdown.appendChild(chapterItem);
            }
            
            // Aktualizujemy podświetlenie bieżącego rozdziału
            updateCurrentChapterHighlight();
        }
        
        // Funkcja aktualizowania podświetlenia bieżącego rozdziału
        function updateCurrentChapterHighlight() {
            const items = document.querySelectorAll('.chapter-list-item');
            items.forEach((item, index) => {
                if (index + 1 === currentChapter) {
                    item.classList.add('current');
                } else {
                    item.classList.remove('current');
                }
            });
        }
        
        // Zamknięcie listy rozwijanej przy kliknięciu poza nią
        document.addEventListener('click', function(e) {
            const dropdown = document.getElementById('chapterListDropdown');
            const chapterInfo = document.querySelector('.chapter-info');
            
            if (!dropdown.contains(e.target) && e.target !== chapterInfo) {
                dropdown.classList.remove('show');
            }
        });

        // Inicjacja przy załadowaniu strony
        window.onload = function() {
            // Получаем номер главы из URL параметров
            const urlParams = new URLSearchParams(window.location.search);
            const chapterParam = urlParams.get('chapter');
            
            if (chapterParam) {
                currentChapter = parseInt(chapterParam);
                // Проверяем, находится ли номер главы в допустимом диапазоне
                if (currentChapter < 1) currentChapter = 1;
                if (currentChapter > totalChapters) currentChapter = totalChapters;
            }
            
            // Загружаем первую или указанную главу
            loadChapter(currentChapter);
            
            // Добавляем обработку навигации клавиатурой
            document.addEventListener('keydown', function(e) {
                if (e.key === 'ArrowLeft') {
                    previousChapter();
                } else if (e.key === 'ArrowRight') {
                    nextChapter();
                }
            });
        };
    </script>
</body>
</html>