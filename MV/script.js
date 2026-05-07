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

// Открытие страницы деталей манги
function openMangaDetail(mangaId, mangaTitle) {
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
        description: 'Дэндзи — парень, живущий в нищете. Однажды он встречает Павиту, которая спасает его от смерти. Теперь Дэндзи живет с ней и её братом-демоном Аки. Вместе они сражаются с демонами, используя способность Дэндзи превращаться в Chainsaw Man. История о мести, дружбе и поиске своего места в мире.',
        rating: '4.8',
        chapters: '110+',
        status: 'Онгоинг',
        year: '2020-2023',
        genres: 'Экшен, Ужасы, Тёмная фэнтези',
        author: 'Tatsuki Fujimoto',
        publisher: 'Shueisha',
        type: 'Манга',
        ageRating: '18+',
        views: '5.2M'
    },
    'spy-x-family': {
        title: 'Spy x Family',
        cover: 'https://www.mangaread.org/wp-content/uploads/2020/05/77.jpg',
        description: 'Лойд Форджер по прозвищу "Твистед" — лучший шпион в мире. Но у него есть слабость: он ничего не знает о семье и школе. Чтобы выполнить свою миссию, ему приходится создать семью. Он усыновляет девочку-телепата по имени Аня, которая умеет читать мысли, и собаку, который может предсказывать будущее. Вместе они начинают жить как обычная семья, скрывая свои настоящие личности друг от друга.',
        rating: '4.7',
        chapters: '86+',
        status: 'Онгоинг',
        year: '2019-2023',
        genres: 'Комедия, Шпион, Школа, Семейная',
        author: 'Tatsuya Endo',
        publisher: 'Shueisha',
        type: 'Манга',
        ageRating: '12+',
        views: '4.2M'
    },
    'blue-lock': {
        title: 'Blue Lock',
        cover: 'https://th.bing.com/th/id/OIP.nVDsfjUO05vrbVj9XCQnugHaKl?w=203&h=289&c=7&r=0&o=5&pid=1.7',
        description: 'Японская сборная по футболу терпит неудачу, и загадочный тренер запускает программу Blue Lock — соревнование, в котором 300 лучших нападающих страны борются за роль лучшего нападающего в мире. Каждая глава — это напряжённый бой за признание, силу и мечту стать величайшим. История о самоопределении, дружбе и преодолении своих пределов.',
        rating: '4.6',
        chapters: '220+',
        status: 'Онгоинг',
        year: '2018-2024',
        genres: 'Спорт, Экшен, Сёнэн, Психологическая',
        author: 'Muneyuki Kaneshiro',
        publisher: 'Kodansha',
        type: 'Манга',
        ageRating: '12+',
        views: '3.8M'
    },
    'solo-leveling': {
        title: 'Solo Leveling',
        cover: 'https://sololevelings.com/volume-covers3/sololeveling.webp',
        description: 'Сунг Джин-Ву — игрок уровня 99, самый сильный в мире. Но однажды он сталкивается с "богом" и погибает, перерождаясь в прошлом. Теперь он должен использовать свои знания из прошлой жизни, чтобы стать сильнейшим игроком в новой реальности. Эпичное приключение в мире геймеров, ставшее хитом по всему миру.',
        rating: '4.9',
        chapters: '190+',
        status: 'Онгоинг',
        year: '2018-2024',
        genres: 'Экшен, Фэнтези, Приключения, Система',
        author: 'Chugong',
        publisher: 'D&C Media',
        type: 'Манхва',
        ageRating: '16+',
        views: '6.1M'
    },
    'vinland-saga': {
        title: 'Vinland Saga',
        cover: 'https://tse3.mm.bing.net/th/id/OIP.lLbWCy-n4XOgSe0_rcsyZQHaKa?r=0&w=711&h=1000&rs=1&pid=ImgDetMain&o=7&rm=3',
        description: 'Торфин — викинг, чей отец был убит в набеге. Вместо мести он решает отправиться в Vinland — землю мира и свободы. Вместе с группой викингов он отправляется в Англию, где сталкивается с новыми идеями и ценностями, которые меняют его представление о мире и о мести. История о взрослении, поиске смысла жизни и мире без насилия.',
        rating: '4.8',
        chapters: '188+',
        status: 'Онгоинг',
        year: '2019-2024',
        genres: 'Приключения, История, Драма, Взрослая',
        author: 'Makoto Yukimura',
        publisher: 'Kodansha',
        type: 'Манга',
        ageRating: '16+',
        views: '4.3M'
    },
    'jujutsu-kaisen': {
        title: 'Jujutsu Kaisen',
        cover: 'https://th.bing.com/th/id/OIP.LuoA0CROQQ13Yn8UYw80hQAAAA?w=202&h=288&c=7&r=0&o=5&dpr=1.5&pid=1.7',
        description: 'Юдзи Итадори — обычный старшеклассник. Но когда он съедает проклятый палец, он попадает в магическую школу и становится охотником на проклятия. Вместе с другими учениками он сражается с различными проклятиями, защищая людей от сверхъестественных угроз. Тёмная фэнтези с уникальной системой магии.',
        rating: '4.8',
        chapters: '245+',
        status: 'Онгоинг',
        year: '2018-2024',
        genres: 'Экшен, Фэнтези, Сёнэн, Школа магии',
        author: 'Gege Akutami',
        publisher: 'Shueisha',
        type: 'Манга',
        ageRating: '16+',
        views: '5.8M'
    },
    'angel-next-door': {
        title: 'Ангел по соседству',
        cover: 'https://remanga.org/media/titles/the-angel-next-door-spoils-me-rotten/cover_86f89808d16442ce.webp',
        description: 'Аманэ Фудзуми живёт по соседству с девушкой по имени Махиру Сиина, красавицей и отличницей, которую все считают ангелом. Сам Аманэ — обычный и ничем не выделяющийся ученик, который ни разу не общался со своей соседкой. Но в один момент он встречает её сидящую под дождём и промокшую до нитки и одолжил свой зонтик. Так начинается история их отношений — история о любви, принятии себя и преодолении комплексов.',
        rating: '4.3',
        chapters: '74+',
        status: 'Онгоинг',
        year: '2020-2023',
        genres: 'Романтика, Комедия, Школа, Повседневность',
        author: 'Wan Shibata',
        publisher: 'Square Enix',
        type: 'Манга',
        ageRating: '16+',
        views: '2.5M'
    },
    'high-school-dxd': {
        title: 'Старшая школа DxD',
        cover: 'https://starshaya-shkola-animego.ru/storage/app/uploads/public/674/33c/3ed/67433c3ed9126532588254.webp',
        description: 'Мечты извращенного юноши Иссея Хёдо, кажется, сбываются, когда красивая Юма Амано приглашает его на свидание. Но когда она раскрывает свою личность как падшего ангела и пытается убить Иссея, его смерть кажется неизбежной, пока старшеклассница по имени Риас Гремори не спасает его. Когда он снова просыпается, она оказывается дьяволом. Чтобы спасти Иссея, она перевоплощает его в своего вида, делая своим новым слугой.',
        status: 'Онгоинг',
        year: '2018-2024',
        genres: 'Фэнтези, Экшен'
    },
    'svinarnik': {
        title: 'Свинарник',
        cover: 'https://mangabuff.ru/img/manga/posters/svinarnik.jpg?1757844502',
        description: 'История о фермере, который оказывается в ужасных условиях и пытается выжить в мире жестокости и насилия.',
        rating: '4.8',
        chapters: '139+',
        status: 'Завершено',
        year: '2010-2019',
        genres: 'Хоррор, Триллер'
    },
    'the-beginning-after-the-end': {
        title: 'The Beginning After The End',
        cover: 'https://erascans.com/wp-content/uploads/2026/02/The-Beginning-After-the-End.jpg',
        description: 'Король Грей, который правил своим королевством 400 лет, перерождается в молодого принца в современном мире.',
        rating: '4.2',
        chapters: '190+',
        status: 'Онгоинг',
        year: '2017-2024',
        genres: 'Фэнтези, Приключения'
    },
    'attack-on-titan': {
        title: 'Attack on Titan',
        cover: 'https://readsnkmanga.com/wp-content/uploads/2025/07/Attack-on-Titan.jpg',
        description: 'Человечество живет за стенами, защищаясь от титанов. Эрен и его друзья решают сражаться с титанами и вернуть свободу.',
        rating: '4.9',
        chapters: '139+',
        status: 'Завершено',
        year: '2013-2023',
        genres: 'Экшен, Драма'
    },
    'dandadan': {
        title: 'Dandadan',
        cover: 'https://www.mangaread.org/wp-content/uploads/2021/09/Read-Manga-12-193x278.jpg',
        description: 'Такэси — парень, который не верит в паранормальное, а Ая — девушка, которая верит в духов. Они сталкиваются с различными сверхъестественными существами.',
        rating: '3.2',
        chapters: '280+',
        status: 'Онгоинг',
        year: '2019-2024',
        genres: 'Комедия, Школа'
    },
    'horimiya': {
        title: 'Horimiya',
        cover: 'https://i.pinimg.com/736x/f8/2d/7b/f82d7bdf3a34b238bb850d59f3ebee0a.jpg',
        description: 'Хори Кёко — популярная девушка в школе, а Миямура Изуми — парень с комплексом неполноценности. Они решают помочь друг другу.',
        rating: '4.2',
        chapters: '140+',
        status: 'Завершено',
        year: '2019-2023',
        genres: 'Романтика, Школа'
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
