// Основной JavaScript функционал для MangaSite

// Переключение меню аккаунта
function toggleMenu() {
    const dropdown = document.getElementById('myDropdown');
    if (dropdown) {
        dropdown.classList.toggle('show');
    }
}

// Закрыть dropdown при клике вне меню
document.addEventListener('click', function(event) {
    const dropdown = document.getElementById('myDropdown');
    const accountBtn = document.querySelector('.account-btn');
    
    if (dropdown && !dropdown.contains(event.target) && !accountBtn.contains(event.target)) {
        dropdown.classList.remove('show');
    }
});

// Открыть модальное окно авторизации
function openAuthModal(type) {
    const modal = document.getElementById('authModal');
    const title = document.getElementById('authTitle');
    const nameField = document.getElementById('authName');
    const nameLabel = document.querySelector('label[for="authName"]');
    const confirmLabel = document.getElementById('confirmPasswordLabel');
    const confirmInput = document.getElementById('authConfirmPassword');
    const submitBtn = document.getElementById('authSubmit');
    const toggleText = document.getElementById('authToggleText');
    const toggleLink = document.getElementById('authToggleLink');
    
    if (type === 'register') {
        title.textContent = 'Регистрация';
        submitBtn.textContent = 'Зарегистрироваться';
        nameField.style.display = 'block';
        nameLabel.style.display = 'block';
        confirmLabel.style.display = 'block';
        confirmInput.style.display = 'block';
        nameField.required = true;
        confirmInput.required = true;
        if (toggleText) toggleText.textContent = 'Уже есть аккаунт?';
        if (toggleLink) toggleLink.textContent = 'Войти';
    } else {
        title.textContent = 'Вход';
        submitBtn.textContent = 'Войти';
        nameField.style.display = 'none';
        nameLabel.style.display = 'none';
        confirmLabel.style.display = 'none';
        confirmInput.style.display = 'none';
        nameField.required = false;
        confirmInput.required = false;
        if (toggleText) toggleText.textContent = 'Нет аккаунта?';
        if (toggleLink) toggleLink.textContent = 'Зарегистрироваться';
    }
    
    modal.classList.add('show');
    // Закрыть dropdown меню
    const dropdown = document.getElementById('myDropdown');
    if (dropdown) {
        dropdown.classList.remove('show');
    }
}

// Переключение между режимами входа и регистрации
function switchAuthMode() {
    const title = document.getElementById('authTitle');
    const isCurrentlyRegister = title.textContent === 'Регистрация';
    
    // Переключить на противоположный режим
    openAuthModal(isCurrentlyRegister ? 'login' : 'register');
}

// Закрыть модальное окно авторизации
function closeAuthModal() {
    const modal = document.getElementById('authModal');
    modal.classList.remove('show');
    // Очистить форму
    document.getElementById('authForm').reset();
}

// Обработка отправки формы авторизации
function submitAuth(event) {
    event.preventDefault();
    
    const isRegister = document.getElementById('authTitle').textContent === 'Регистрация';
    const name = document.getElementById('authName').value;
    const email = document.getElementById('authEmail').value;
    const password = document.getElementById('authPassword').value;
    const confirmPassword = document.getElementById('authConfirmPassword').value;
    
    if (isRegister && password !== confirmPassword) {
        alert('Пароли не совпадают!');
        return;
    }
    
    if (isRegister) {
        handleRegister({ name, email, password, confirmPassword });
    } else {
        handleLogin({ email, password });
    }
}

// Закрытие модального окна и меню при клике вне их
window.onclick = function(event) {
    // Закрытие модального окна при клике вне его
    const modal = document.getElementById('authModal');
    if (event.target === modal) {
        closeAuthModal();
    }
    
    // Закрытие меню при клике вне его
    if (!event.target.matches('.account-btn')) {
        const dropdowns = document.getElementsByClassName('dropdown-content');
        for (let i = 0; i < dropdowns.length; i++) {
            const openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
};

// Навигация между страницами
function goToPage(page) {
    window.location.href = `${page}.html`;
}

// Переход к каталогу с фильтром по жанру
function goToCatalog(genre) {
    window.location.href = `catalog.html?genre=${encodeURIComponent(genre)}`;
}

// Переход на страницу жанра
function goToGenrePage(genre) {
    window.location.href = `genre.html?genre=${encodeURIComponent(genre)}`;
}

// Переход на страницу подборки
function goToCollection(collection) {
    window.location.href = `collection.html?collection=${encodeURIComponent(collection)}`;
}

// Скролл слайдера
function scrollSlider(sliderId, direction) {
    const slider = document.getElementById(sliderId);
    if (slider) {
        const scrollAmount = 300;
        if (direction === 'left') {
            slider.scrollBy({ left: -scrollAmount, behavior: 'smooth' });
        } else if (direction === 'right') {
            slider.scrollBy({ left: scrollAmount, behavior: 'smooth' });
        }
    }
}

// Функция для регистрации (заглушка)
function handleRegister(userData) {
    console.log('Register:', userData);
    alert('Функция регистрации временно отключена');
}

// Функция для входа (заглушка)
function handleLogin(credentials) {
    console.log('Login:', credentials);
    alert('Функция входа временно отключена');
}

// Поиск по сайту
function performSearch() {
    const searchInput = document.getElementById('searchInput');
    const searchTerm = searchInput.value.trim();
    
    if (searchTerm) {
        // Переход на страницу результатов поиска
        window.location.href = `search.html?q=${encodeURIComponent(searchTerm)}`;
    }
}

// Обработка Enter в поисковой строке
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('searchInput');
    if (searchInput) {
        searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                performSearch();
            }
        });
    }
});

// Добавление в избранное (заглушка)
function addToFavorites(mangaTitle) {
    alert(`Добавлено в избранное: ${mangaTitle}`);
}

// Начать чтение (заглушка)
function startReading(mangaTitle, mangaUrl) {
    alert(`Начать чтение: ${mangaTitle}`);
}

// Функция для показа уведомлений
function showNotification(message, type = 'info') {
    // Создание элемента уведомления
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    
    // Стили уведомления
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 20px;
        border-radius: 8px;
        color: white;
        font-weight: 500;
        z-index: 10000;
        transform: translateX(100%);
        transition: transform 0.3s ease;
        max-width: 300px;
        word-wrap: break-word;
    `;
    
    // Цвет в зависимости от типа
    if (type === 'success') {
        notification.style.background = 'linear-gradient(135deg, #10b981, #059669)';
    } else if (type === 'error') {
        notification.style.background = 'linear-gradient(135deg, #ef4444, #dc2626)';
    } else {
        notification.style.background = 'linear-gradient(135deg, #8b5cf6, #7c3aed)';
    }
    
    document.body.appendChild(notification);
    
    // Анимация появления
    setTimeout(() => {
        notification.style.transform = 'translateX(0)';
    }, 100);
    
    // Автоматическое скрытие через 5 секунд
    setTimeout(() => {
        notification.style.transform = 'translateX(100%)';
        setTimeout(() => {
            if (notification.parentNode) {
                notification.parentNode.removeChild(notification);
            }
        }, 300);
    }, 5000);
}

// Фильтрация каталога
function filterCatalog() {
    const genreFilter = document.getElementById('genreFilter');
    const statusFilter = document.getElementById('statusFilter');
    
    if (!genreFilter || !statusFilter) return;
    
    const genre = genreFilter.value;
    const status = statusFilter.value;
    
    // Построение URL с фильтрами
    let url = 'catalog.html';
    const params = [];
    
    if (genre) params.push(`genre=${encodeURIComponent(genre)}`);
    if (status) params.push(`status=${encodeURIComponent(status)}`);
    
    if (params.length > 0) {
        url += '?' + params.join('&');
    }
    
    window.location.href = url;
}

// Сортировка каталога
function sortCatalog(sortBy) {
    const currentUrl = new URL(window.location.href);
    currentUrl.searchParams.set('sort', sortBy);
    window.location.href = currentUrl.toString();
}

// Загрузка дополнительных элементов каталога
function loadMoreCatalog() {
    // Заглушка для загрузки дополнительных элементов
    console.log('Loading more catalog items...');
}

// Открытие страницы чтения манги
function openMangaReader(mangaId, mangaTitle) {
    // Переход на страницу чтения с параметрами
    window.location.href = `manga-reader.html?id=${mangaId}&chapter=1`;
}

// Маппинг названий манги на ID
const mangaTitleToId = {
    'angel-next-door': 'angel-next-door',
    'high-school-dxd': 'high-school-dxd',
    'chainsaw-man': 'chainsaw-man',
    'spy-x-family': 'spy-x-family',
    'blue-lock': 'blue-lock',
    'solo-leveling': 'solo-leveling',
    'vinland-saga': 'vinland-saga',
    'the-beginning-after-the-end': 'the-beginning-after-the-end',
    'jujutsu-kaisen': 'jujutsu-kaisen',
    'attack-on-titan': 'attack-on-titan',
    'dandadan': 'dandadan',
    'One Punch Man': 'one-punch-man',
    'Demon Slayer': 'demon-slayer',
    'Your Lie in April': 'your-lie-in-april',
    'Komi-san': 'komi-san',
    'Mashle': 'mashle',
    'Horimiya': 'horimiya',
    'Свинарник': 'svinarnik'
};

// Открытие страницы деталей манги
function openMangaDetail(mangaIdOrTitle, mangaTitle) {
    // Определяем ID манги
    let mangaId;

    // Если передан параметр есть в маппинге, используем его
    if (mangaTitleToId[mangaIdOrTitle]) {
        mangaId = mangaTitleToId[mangaIdOrTitle];
    } else if (mangaData[mangaIdOrTitle]) {
        // Если переданный параметр уже является валидным ID
        mangaId = mangaIdOrTitle;
    } else {
        // Иначе пытаемся преобразовать название в kebab-case ID
        mangaId = mangaIdOrTitle.toLowerCase()
            .replace(/\s+/g, '-')
            .replace(/[^a-z0-9\-]/g, '');
    }

    // Переход на страницу деталей с параметрами
    window.location.href = `manga-detail-modern.html?id=${mangaId}`;
}

// Создание меню при наведении на карточку манги
function createMangaHoverMenu(mangaId, mangaTitle, coverUrl, description, rating, chapters, status, year, genres) {
    const menu = document.createElement('div');
    menu.className = 'manga-hover-menu';
    menu.innerHTML = `
        <div class="manga-hover-menu-content">
            <img src="${coverUrl}" alt="${mangaTitle}" class="manga-menu-cover">
            <div class="manga-menu-info">
                <h3 class="manga-menu-title">${mangaTitle}</h3>
                <div class="manga-menu-meta">
                    <div class="manga-menu-stats">
                        <div class="manga-menu-stat">
                            <span class="manga-menu-stat-icon">📖</span>
                            <span class="manga-menu-stat-text">${chapters} глав</span>
                        </div>
                        <div class="manga-menu-stat">
                            <span class="manga-menu-stat-icon">⭐</span>
                            <span class="manga-menu-stat-text">${rating}</span>
                        </div>
                    </div>
                    <div class="manga-menu-tags">
                        ${genres.split(',').map(genre => `<span class="manga-menu-tag">${genre.trim()}</span>`).join('')}
                    </div>
                </div>
                <div class="manga-menu-description">
                    ${description}
                </div>
                <div class="manga-menu-rating">
                    <span class="manga-menu-stars">${'⭐'.repeat(Math.floor(parseFloat(rating)))}</span>
                    <span class="manga-menu-rating-value">${rating}</span>
                </div>
                <div class="manga-menu-actions">
                    <button class="manga-menu-btn manga-menu-btn-primary" onclick="openMangaReader('${mangaId}', '${mangaTitle}')">
                        <span>📖</span>
                        <span>Читать</span>
                    </button>
                    <button class="manga-menu-btn manga-menu-btn-secondary" onclick="showMangaDetails('${mangaId}')">
                        <span>ℹ️</span>
                        <span>Подробнее</span>
                    </button>
                </div>
            </div>
        </div>
    `;
    
    return menu;
}

const mangaData = {
    'chainsaw-man': {
        title: 'Chainsaw Man',
        cover: 'https://cdn.tsnocheck.ru/static/99fca753-b234-482c-89c4-3d878cadeb2e.avif',
        description: 'Denji to chłopak żyjący w nędzy. Pewnego dnia spotyka Pavitę, która ratuje go przed śmiercią. Teraz Denji żyje z nią i jej bratem-demonem Aki. Razem walczą z demonami, wykorzystując zdolność Denjiego do przemiany w Chainsaw Mana. Historia o zemście, przyjaźni i poszukiwaniu swojego miejsca w świecie.',
        rating: '4.8',
        chapters: '110+',
        status: 'Wydawane',
        year: '2020-2023',
        genres: 'Akcja, Horror, Dark Fantasy',
        author: 'Tatsuki Fujimoto',
        publisher: 'Shueisha',
        type: 'Manga',
        ageRating: '18+',
        views: '5.2M'
    },
    'spy-family': {
        title: 'Spy x Family',
        cover: 'https://www.mangaread.org/wp-content/uploads/2020/05/77.jpg',
        description: 'Loid Forger, znany jako "Twilight", to najlepszy szpion na świecie. Ale ma słabość: nic nie wie o rodzinie i szkole. Aby wykonać misję, musi stworzyć rodzinę. Adoptuje dziewczynkę-telepatę o imieniu Anya, która potrafi czytać w myślach, i psa, który może przewidywać przyszłość. Razem zaczynają żyć jak normalna rodzina, ukrywając swoje prawdziwe tożsamości.',
        rating: '4.7',
        chapters: '86+',
        status: 'Wydawane',
        year: '2019-2023',
        genres: 'Komedia, Szpiegostwo, Szkoła, Rodzinna',
        author: 'Tatsuya Endo',
        publisher: 'Shueisha',
        type: 'Manga',
        ageRating: '12+',
        views: '4.2M'
    },
    'blue-lock': {
        title: 'Blue Lock',
        cover: 'https://th.bing.com/th/id/OIP.nVDsfjUO05vrbVj9XCQnugHaKl?w=203&h=289&c=7&r=0&o=5&pid=1.7',
        description: 'Japońska reprezentacja piłkarska ponosi porażkę, a tajemniczy trener uruchamia program Blue Lock — rywalizację, w której 300 najlepszych napastników kraju walczy o rolę najlepszego napastnika na świecie. Każdy rozdział to napięta walka o uznanie, siłę i marzenie o zostaniu najwielkim. Historia o samorealizacji, przyjaźni i przezwyciężaniu własnych granic.',
        rating: '4.6',
        chapters: '220+',
        status: 'Wydawane',
        year: '2018-2024',
        genres: 'Sport, Akcja, Shōnen, Psychologiczne',
        author: 'Muneyuki Kaneshiro',
        publisher: 'Kodansha',
        type: 'Manga',
        ageRating: '12+',
        views: '3.8M'
    },
    'solo-leveling': {
        title: 'Solo Leveling',
        cover: 'https://sololevelings.com/volume-covers3/sololeveling.webp',
        description: 'Sung Jin-Woo to gracz poziomu 99, najsilniejszy na świecie. Ale pewnego dnia spotyka "boga" i ginie, odradzając się w przeszłości. Teraz musi wykorzystać wiedzę z poprzedniego życia, aby stać się najsilniejszym graczem w nowej rzeczywistości. Epicka przygoda w świecie graczy, która stała się hitem na całym świecie.',
        rating: '4.9',
        chapters: '190+',
        status: 'Wydawane',
        year: '2018-2024',
        genres: 'Akcja, Fantasy, Przygoda, System',
        author: 'Chugong',
        publisher: 'D&C Media',
        type: 'Manhwa',
        ageRating: '16+',
        views: '6.1M'
    },
    'vinland-saga': {
        title: 'Vinland Saga',
        cover: 'https://tse3.mm.bing.net/th/id/OIP.lLbWCy-n4XOgSe0_rcsyZQHaKa?r=0&w=711&h=1000&rs=1&pid=ImgDetMain&o=7&rm=3',
        description: 'Thorfin to wiking, którego ojciec został zabity w najechu. Zamiast zemsty postanawia udać się do Vinland — ziemi pokoju i wolności. Razem z grupą wikingów wyrusza do Anglii, gdzie styka się z nowymi ideami i wartościami, które zmieniają jego postrzeganie świata i zemsty. Historia o dojrzewaniu, poszukiwaniu sensu życia i świecie bez przemocy.',
        rating: '4.8',
        chapters: '188+',
        status: 'Wydawane',
        year: '2019-2024',
        genres: 'Przygoda, Historyczne, Dramat, Dla dorosłych',
        author: 'Makoto Yukimura',
        publisher: 'Kodansha',
        type: 'Manga',
        ageRating: '16+',
        views: '4.3M'
    },
    'jujutsu-kaisen': {
        title: 'Jujutsu Kaisen',
        cover: 'https://th.bing.com/th/id/OIP.LuoA0CROQQ13Yn8UYw80hQAAAA?w=202&h=288&c=7&r=0&o=5&dpr=1.5&pid=1.7',
        description: 'Yuji Itadori to zwykły uczeń liceum. Ale gdy zjada przeklęty palec, trafia do magicznej szkoły i zostaje łowcą przekleństw. Razem z innymi uczniami walczy z różnymi przekleństwami, chroniąc ludzi przed nadprzyrodzonymi zagrożeniami. Mroczne fantasy z unikalnym systemem magii.',
        rating: '4.8',
        chapters: '245+',
        status: 'Wydawane',
        year: '2018-2024',
        genres: 'Akcja, Fantasy, Shōnen, Szkoła magii',
        author: 'Gege Akutami',
        publisher: 'Shueisha',
        type: 'Manga',
        ageRating: '16+',
        views: '5.8M'
    },
    'angel-next-door': {
        title: 'angel-next-door',
        cover: 'https://remanga.org/media/titles/the-angel-next-door-spoils-me-rotten/cover_86f89808d16442ce.webp',
        description: 'Amane Fujimi mieszka obok dziewczyny o imieniu Mahiru Shiina, piękności i prymusu, którą wszyscy nazywają aniołem. Sam Amane to zwykły i niczym niewyróżniający się uczeń, który nigdy nie rozmawiał z sąsiadką. Ale w pewnym momencie spotyka ją siedzącą pod deszczem, przemokniętą do nitki i pożycza jej parasol. Tak zaczyna się historia ich relacji — historia o miłości, akceptacji siebie i przezwyciężaniu kompleksów.',
        rating: '4.3',
        chapters: '39',
        status: 'Wydawane',
        year: '2020-2023',
        genres: 'Romans, Komedia, Szkoła, Codzienność',
        author: 'Wan Shibata',
        publisher: 'Square Enix',
        type: 'Manga',
        ageRating: '16+',
        views: '2.5M'
    },
    'high-school-dxd': {
        title: 'high-school-dxd',
        cover: 'https://starshaya-shkola-animego.ru/storage/app/uploads/public/674/33c/3ed/67433c3ed9126532588254.webp',
        description: 'Marzenia perwersyjnego młodzieńca Issei Hyodo zdają się spełniać, gdy piękna Yuma Amano zaprasza go na randkę. Ale gdy ujawnia swoją tożsamość jako upadły anioł i próbuje zabić Issei, jego śmierć wydaje się nieunikniona, dopóki uczennica liceum o imieniu Rias Gremory nie ratuje go. Gdy się budzi, okazuje się, że ona jest diabłem. Aby uratować Issei, przemienia go w swoją rasę, czyniąc swoim nowym sługą.',
        rating: '3.8',
        chapters: '25+',
        status: 'Wydawane',
        year: '2018-2024',
        genres: 'Fantasy, Akcja',
        author: 'Ichiei Ishibumi',
        publisher: 'Fujimi Shobo',
        type: 'Light Novel',
        ageRating: '18+',
        views: '3.2M'
    },
    'pigsty': {
        title: 'Pigsty',
        cover: 'https://mangabuff.ru/img/manga/posters/svinarnik.jpg?1757844502',
        description: 'Historia o rolniku, który znajduje się w strasznych warunkach i próbuje przetrwać w świecie okrucieństwa i przemocy. Mistyczny thriller z elementami horroru.',
        rating: '4.5',
        chapters: '50+',
        status: 'Wydawane',
        year: '2022-2024',
        genres: 'Horror, Thriller, Psychologiczne',
        author: 'Unknown',
        publisher: '-',
        type: 'Manhwa',
        ageRating: '18+',
        views: '2.1M'
    },
    'beginning-after-end': {
        title: 'The Beginning After The End',
        cover: 'https://erascans.com/wp-content/uploads/2026/02/The-Beginning-After-the-End.jpg',
        description: 'Król Grey, który rządził swoim królestwem przez 400 lat, odradza się jako młody książę w nowoczesnym świecie. Teraz ma szansę naprawić błędy poprzedniego życia i chronić tych, których kocha.',
        rating: '4.2',
        chapters: '190+',
        status: 'Wydawane',
        year: '2017-2024',
        genres: 'Fantasy, Przygoda',
        author: 'TurtleMe',
        publisher: 'Tapas Media',
        type: 'Manhwa',
        ageRating: '13+',
        views: '4.1M'
    },
    'attack-on-titan': {
        title: 'Attack on Titan',
        cover: 'https://readsnkmanga.com/wp-content/uploads/2025/07/Attack-on-Titan.jpg',
        description: 'Ludzkość żyje za ogromnymi murami, chroniąc się przed gigantycznymi istotami znanymi jako tytani. Eren Yeager przysięga zniszczyć wszystkich tytanów po tym, jak zniszczą jego miasto i zabiją jego matkę.',
        rating: '4.9',
        chapters: '139',
        status: 'Zakończone',
        year: '2009-2021',
        genres: 'Akcja, Dramat',
        author: 'Hajime Isayama',
        publisher: 'Kodansha',
        type: 'Manga',
        ageRating: '16+',
        views: '8.5M'
    },
    'dandadan': {
        title: 'Dandadan',
        cover: 'https://www.mangaread.org/wp-content/uploads/2021/09/Read-Manga-12-193x278.jpg',
        description: 'Okarun to chłopak, który nie wierzy w duchy, a Momo to dziewczyna, która nie wierzy w kosmitów. Zawierają zakład, aby udowodnić sobie nawzajem, kto ma rację. Ale oboje się mylą i teraz muszą walczyć z nadprzyrodzonymi istotami.',
        rating: '4.8',
        chapters: '280+',
        status: 'Wydawane',
        year: '2021-2024',
        genres: 'Komedia, Szkoła, Nadprzyrodzone',
        author: 'Tatsu Yukinobu',
        publisher: 'Shueisha',
        type: 'Manga',
        ageRating: '16+',
        views: '3.5M'
    },
    'horimiya': {
        title: 'Horimiya',
        cover: 'https://i.pinimg.com/736x/f8/2d/7b/f82d7bdf3a34b238bb850d59f3ebee0a.jpg',
        description: 'Kyoko Hori to popularna dziewczyna w szkole, która ukrywa swoje życie domowe. Izumi Miyamura to cichy chłopak z tatuażami i piercingiem, którego wszyscy uważają za otaku. Gdy przypadkowo dowiadują się prawdy o sobie nawzajem, nawiązują nieoczekiwaną przyjaźń.',
        rating: '4.2',
        chapters: '140',
        status: 'Zakończone',
        year: '2011-2021',
        genres: 'Romans, Szkoła',
        author: 'HERO, Daisuke Hagiwara',
        publisher: 'Square Enix',
        type: 'Manga',
        ageRating: '13+',
        views: '5.2M'
    },
    // Nowe mangi z katalogu
    'one-punch-man': {
        title: 'One Punch Man',
        cover: 'https://th.bing.com/th/id/OIP.FDIGY5BaiJt5GymYknPo4AHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7',
        description: 'Saitama to zwykły facet, który trenował tak ciężko, że stracił wszystkie włosy. Teraz jest tak silny, że pokonuje każdego przeciwnika jednym ciosem. Nudząc się brakiem godnych przeciwników, szuka sensu życia jako superbohater.',
        rating: '4.8',
        chapters: '200+',
        status: 'Wydawane',
        year: '2012-2024',
        genres: 'Akcja, Komedia, Superbohaterowie',
        author: 'ONE, Yusuke Murata',
        publisher: 'Shueisha',
        type: 'Манга',
        ageRating: '13+',
        views: '7.8M'
    },
    'demon-slayer': {
        title: 'Demon Slayer',
        cover: 'https://th.bing.com/th/id/OIP.02gfHepkMJgAZQEsiJu7aAHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7',
        description: 'Tanjiro Kamado żyje szczęśliwym życiem z rodziną, dopóki demony nie zabijają wszystkich poza jego siostrą Nezuko. Zamienia się w demona, a Tanjiro wyrusza w niebezpieczną podróż, aby znaleźć lekarstwo i zemścić się.',
        rating: '4.8',
        chapters: '205',
        status: 'Zakończone',
        year: '2016-2020',
        genres: 'Akcja, Fantasy, Historyczne',
        author: 'Koyoharu Gotouge',
        publisher: 'Shueisha',
        type: 'Manga',
        ageRating: '13+',
        views: '9.2M'
    },
    'your-lie-april': {
        title: 'Your Lie in April',
        cover: 'https://tse1.mm.bing.net/th/id/OIP.qL-K8tWwrIB8gZ8M2rjzyQAAAA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        description: 'Kosei Arima był geniuszem pianisty w dzieciństwie, ale przestał grać po śmierci matki. Spotkanie z niezwykłą skrzypaczką Kaori Miyazono zmienia jego życie i przywraca go do muzyki. Wzruszająca historia o miłości, muzyce i uzdrowieniu.',
        rating: '4.4',
        chapters: '44',
        status: 'Zakończone',
        year: '2011-2015',
        genres: 'Romans, Dramat, Muzyka',
        author: 'Naoshi Arakawa',
        publisher: 'Kodansha',
        type: 'Manga',
        ageRating: '13+',
        views: '4.8M'
    },
    'komi-san': {
        title: 'Komi-san',
        cover: 'https://i1.whakoom.com/large/03/0e/b0900672d5ba4aa9832f19264f8b9f01.jpg',
        description: 'Shoko Komi to piękna i mądra dziewczyna, ale cierpi na ekstremalną nieśmiałość społeczną i nie może rozmawiać z ludźmi. Jej kolega z klasy Hitohito Tadano przysięga pomóc jej zdobyć 100 przyjaciół. Zabawna historia o przezwyciężaniu lęku przed kontaktami społecznymi.',
        rating: '4.7',
        chapters: '400+',
        status: 'Wydawane',
        year: '2016-2024',
        genres: 'Komedia, Szkoła, Codzienność',
        author: 'Tomohito Oda',
        publisher: 'Shogakukan',
        type: 'Manga',
        ageRating: '13+',
        views: '5.5M'
    },
    'mashle': {
        title: 'Mashle',
        cover: 'https://tse2.mm.bing.net/th/id/OIP.cgRZIP2f1gP-ddCv6G4iowHaK0?r=0&pid=ImgDet&w=206&h=300&c=7&dpr=1,5&o=7&rm=3',
        description: 'W świecie, w którym magia to wszystko, Mash Burnedead urodził się bez niej. Aby uratować rodzinę, wstępuje do magicznej akademii, polegając tylko na swojej niewiarygodnej sile fizycznej. Zabawna przygoda o tym, jak mięśnie pokonują magię.',
        rating: '4.0',
        chapters: '162',
        status: 'Zakończone',
        year: '2020-2023',
        genres: 'Komedia, Szkoła, Magia',
        author: 'Hajime Komoto',
        publisher: 'Shueisha',
        type: 'Manga',
        ageRating: '13+',
        views: '3.8M'
    }
};

// Инициализация меню для карточек манги
function initMangaCardMenus() {
    const cards = document.querySelectorAll('.manga-card-simple');
    
    cards.forEach(card => {
        // Получаем ID манги из onclick атрибута
        const onclickAttr = card.getAttribute('onclick');
        if (!onclickAttr) return;
        
        const match = onclickAttr.match(/openMangaReader\('([^']+)', '([^']+)'\)/);
        if (!match) return;
        
        const mangaId = match[1];
        const mangaTitle = match[2];
        const data = mangaData[mangaId];
        
        if (!data) return;
        
        // Создаем меню
        const menu = createMangaHoverMenu(
            mangaId,
            mangaTitle,
            data.cover,
            data.description,
            data.rating,
            data.chapters,
            data.status,
            data.year,
            data.genres
        );
        
        // Добавляем меню в карточку
        card.appendChild(menu);
        
        // Обработчики событий
        card.addEventListener('mouseenter', () => {
            // Закрываем другие открытые меню
            document.querySelectorAll('.manga-hover-menu').forEach(otherMenu => {
                if (otherMenu !== menu) {
                    otherMenu.classList.remove('show');
                }
            });
            menu.classList.add('show');
        });
        
        card.addEventListener('mouseleave', () => {
            setTimeout(() => {
                menu.classList.remove('show');
            }, 100);
        });
        
        // Предотвращаем закрытие при наведении на само меню
        menu.addEventListener('mouseenter', () => {
            menu.classList.add('show');
        });
    });
}

// Инициализация при загрузке страницы
document.addEventListener('DOMContentLoaded', initMangaCardMenus);


// Функция для отображения модального окна с деталями
function showMangaDetails(mangaId) {
    // Заглушка для отображения деталей манги
    alert(`Показать детали манги ID: ${mangaId}`);
}
