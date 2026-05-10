// Локальная база данных для fallback (gdy PHP niedostępny)
const localMangaDB = [
    {
        id: 'angel-next-door',
        title: 'angel-next-door',
        cover: 'gg.webp',
        type: 'Манга',
        year: '2019',
        status: 'Wydawane',
        genres: 'Romans, Szkolne, Codzienne życie',
        rating: '4.9'
    },
    {
        id: 'high-school-dxd',
        title: 'High School DxD',
        cover: 'https://ui-library.pexels.lol/picture/image/lRRK7.webp',
        type: 'Манга',
        year: '2016',
        status: 'Zakończone',
        genres: 'Akcja, Fantastyka, Romans',
        rating: '4.8'
    },
    {
        id: 'chainsaw-man',
        title: 'Chainsaw Man',
        cover: 'https://cdn.tsnocheck.ru/static/99fca753-b234-482c-89c4-3d878cadeb2e.avif',
        type: 'Манга',
        year: '2018',
        status: 'Wydawane',
        genres: 'Akcja, Horror, Czarna komedia',
        rating: '4.9'
    },
    {
        id: 'dandadan',
        title: 'Dandadan',
        cover: 'https://th.bing.com/th/id/OIP.q3IAI_AydfptQNSUihlpNQHaLH?w=203&h=304&c=7&r=0&o=7&pid=1.7&rm=3',
        type: 'Манга',
        year: '2021',
        status: 'Wydawane',
        genres: 'Akcja, Science Fiction, Romans',
        rating: '4.8'
    },
    {
        id: 'jujutsu-kaisen',
        title: 'Jujutsu Kaisen',
        cover: 'https://th.bing.com/th/id/OIP.LuoA0CROQQ13Yn8UYw80hQAAAA?w=202&h=288&c=7&r=0&o=5&dpr=1.5&pid=1.7',
        type: 'Манга',
        year: '2018',
        status: 'Zakończone',
        genres: 'Akcja, Fantastyka, Przygoda',
        rating: '4.8'
    },
    {
        id: 'spy-family',
        title: 'Spy x Family',
        cover: 'https://www.mangaread.org/wp-content/uploads/2020/05/77.jpg',
        type: 'Манга',
        year: '2019',
        status: 'Wydawane',
        genres: 'Akcja, Komedia, Szkolne',
        rating: '4.9'
    },
    {
        id: 'attack-on-titan',
        title: 'Attack on Titan',
        cover: 'https://readsnkmanga.com/wp-content/uploads/2025/07/Attack-on-Titan.jpg',
        type: 'Манга',
        year: '2009',
        status: 'Zakończone',
        genres: 'Akcja, Dramat, Postapokalipsa',
        rating: '4.9'
    },
    // Dodatkowe tytuły
    {
        id: 'solo-leveling',
        title: 'Solo Leveling',
        cover: 'https://sololevelings.com/volume-covers3/sololeveling.webp',
        type: 'Манхва',
        year: '2018',
        status: 'Zakończone',
        genres: 'Akcja, Fantastyka, Przygoda',
        rating: '4.9'
    },
    {
        id: 'blue-lock',
        title: 'Blue Lock',
        cover: 'https://th.bing.com/th/id/OIP.nVDsfjUO05vrbVj9XCQnugHaKl?w=203&h=289&c=7&r=0&o=5&pid=1.7',
        type: 'Манга',
        year: '2018',
        status: 'Wydawane',
        genres: 'Sport, Akcja, Psychologiczne',
        rating: '4.6'
    },
    {
        id: 'vinland-saga',
        title: 'Vinland Saga',
        cover: 'https://tse3.mm.bing.net/th/id/OIP.lLbWCy-n4XOgSe0_rcsyZQHaKa?r=0&w=711&h=1000&rs=1&pid=ImgDetMain&o=7&rm=3',
        type: 'Манга',
        year: '2005',
        status: 'Wydawane',
        genres: 'Akcja, Przygoda, Historyczne',
        rating: '4.8'
    },
    {
        id: 'one-punch-man',
        title: 'One Punch Man',
        cover: 'https://th.bing.com/th/id/OIP.FDIGY5BaiJt5GymYknPo4AHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7',
        type: 'Манга',
        year: '2012',
        status: 'Wydawane',
        genres: 'Akcja, Komedia, Superbohaterowie',
        rating: '4.8'
    },
    {
        id: 'demon-slayer',
        title: 'Demon Slayer',
        cover: 'https://th.bing.com/th/id/OIP.02gfHepkMJgAZQEsiJu7aAHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.5&pid=1.7',
        type: 'Манга',
        year: '2016',
        status: 'Zakończone',
        genres: 'Akcja, Fantastyka, Sztuki walki',
        rating: '4.9'
    },
    {
        id: 'horimiya',
        title: 'Horimiya',
        cover: 'https://i.pinimg.com/736x/f8/2d/7b/f82d7bdf3a34b238bb850d59f3ebee0a.jpg',
        type: 'Манга',
        year: '2011',
        status: 'Zakończone',
        genres: 'Romans, Szkolne, Komedia',
        rating: '4.7'
    },
    {
        id: 'komi-san',
        title: 'Komi-san wa Komyushou desu',
        cover: 'https://upload.wikimedia.org/wikipedia/en/thumb/d/d1/Cover_Art_Komi-san_wa%2C_Komyushou_desu_Vol_1.jpg/250px-Cover_Art_Komi-san_wa%2C_Komyushou_desu_Vol_1.jpg',
        type: 'Манга',
        year: '2016',
        status: 'Zakończone',
        genres: 'Komedia, Szkolne, Romans',
        rating: '4.6'
    },
    {
        id: 'mashle',
        title: 'Mashle',
        cover: 'https://wallpaper.dog/large/20663446.jpg',
        type: 'Манга',
        year: '2020',
        status: 'Zakończone',
        genres: 'Akcja, Komedia, Magia',
        rating: '4.5'
    },
    {
        id: 'beginning-after-end',
        title: 'The Beginning After The End',
        cover: 'https://erascans.com/wp-content/uploads/2026/02/The-Beginning-After-the-End.jpg',
        type: 'Манхва',
        year: '2017',
        status: 'Wydawane',
        genres: 'Fantastyka, Przygoda, Akcja',
        rating: '4.7'
    },
    {
        id: 'your-lie-april',
        title: 'Your Lie in April',
        cover: 'https://tse1.mm.bing.net/th/id/OIP.qL-K8tWwrIB8gZ8M2rjzyQAAAA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        type: 'Манга',
        year: '2011',
        status: 'Zakończone',
        genres: 'Romans, Dramat, Muzyka',
        rating: '4.9'
    },
    {
        id: 'pigsty',
        title: 'Pigsty',
        cover: 'https://mangabuff.ru/img/manga/posters/svinarnik.jpg?1757844502',
        type: 'Манхва',
        year: '2022',
        status: 'Wydawane',
        genres: 'Horror, Thriller, Psychologiczne',
        rating: '4.5'
    }
];

// Клиент для PHP API фильтрации манги
class MangaCatalogAPI {
    constructor() {
        this.apiUrl = 'api/manga.php';
        this.mangaData = [];
        this.currentFilters = {};
        this.useLocalData = false;
    }

    // Локальная фильтрация (fallback)
    filterLocalData(filters) {
        return localMangaDB.filter(manga => {
            if (filters.genre && filters.genre !== 'all') {
                if (!manga.genres.toLowerCase().includes(filters.genre.toLowerCase()) &&
                    !manga.tags.toLowerCase().includes(filters.genre.toLowerCase())) {
                    return false;
                }
            }
            if (filters.type && filters.type !== 'all' && manga.type !== filters.type) {
                return false;
            }
            if (filters.status && filters.status !== 'all' && manga.status !== filters.status) {
                return false;
            }
            if (filters.yearFrom && parseInt(manga.year) < parseInt(filters.yearFrom)) {
                return false;
            }
            if (filters.yearTo && parseInt(manga.year) > parseInt(filters.yearTo)) {
                return false;
            }
            if (filters.rating && filters.rating !== 'all' && parseFloat(manga.rating) < parseFloat(filters.rating)) {
                return false;
            }
            if (filters.search && !manga.title.toLowerCase().includes(filters.search.toLowerCase())) {
                return false;
            }
            return true;
        });
    }

    // Загрузка манги с фильтрами
    async loadManga(filters = {}) {
        try {
            // Собираем параметры
            const params = new URLSearchParams();
            
            if (filters.genre && filters.genre !== 'all') {
                params.append('genre', filters.genre);
            }
            if (filters.type && filters.type !== 'all') {
                params.append('type', filters.type);
            }
            if (filters.status && filters.status !== 'all') {
                params.append('status', filters.status);
            }
            if (filters.yearFrom) {
                params.append('year_from', filters.yearFrom);
            }
            if (filters.yearTo) {
                params.append('year_to', filters.yearTo);
            }
            if (filters.rating && filters.rating !== 'all') {
                params.append('rating', filters.rating);
            }
            if (filters.search) {
                params.append('search', filters.search);
            }

            const url = `${this.apiUrl}?${params.toString()}`;
            console.log('Fetching:', url);

            const response = await fetch(url);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            const data = await response.json();
            this.mangaData = data.data || [];
            this.currentFilters = data.applied_filters || {};
            this.useLocalData = false;

            console.log('Loaded', this.mangaData.length, 'manga items from PHP API');
            return {
                success: true,
                data: this.mangaData,
                filters: data.filters,
                count: data.count
            };
        } catch (error) {
            console.warn('PHP API unavailable, using local data:', error.message);
            this.useLocalData = true;
            
            // Fallback na локальные данные
            const filteredData = this.filterLocalData(filters);
            
            return {
                success: true,
                data: filteredData,
                filters: {
                    years: [...new Set(localMangaDB.map(m => m.year))].sort().reverse(),
                    genres: [...new Set(localMangaDB.flatMap(m => m.genres.split(', ')))].sort(),
                    types: ['Манга'],
                    statuses: [...new Set(localMangaDB.map(m => m.status))]
                },
                count: filteredData.length,
                fallback: true
            };
        }
    }

    // Загрузка доступных фильтров
    async loadFilters() {
        try {
            const response = await fetch(`${this.apiUrl}?action=filters`);
            const data = await response.json();
            return data.filters || {};
        } catch (error) {
            console.warn('PHP API unavailable for filters, using local data');
            // Fallback na локальные данные
            return {
                years: [...new Set(localMangaDB.map(m => m.year))].sort().reverse(),
                genres: [...new Set(localMangaDB.flatMap(m => m.genres.split(', ')))].sort(),
                types: ['Манга', 'Манхва', 'Маньхуа'],
                statuses: ['Wydawane', 'Zakończone', 'Zawieszone']
            };
        }
    }

    // Применение фильтров к DOM
    applyFiltersToDOM(filters) {
        // Заполнение select годов
        const yearSelect = document.getElementById('yearFilter');
        if (yearSelect && filters.years) {
            yearSelect.innerHTML = '<option value="all">Wszystkie lata</option>';
            filters.years.forEach(year => {
                yearSelect.innerHTML += `<option value="${year}">${year}</option>`;
            });
        }

        // Заполнение select жанров
        const genreSelect = document.getElementById('genreFilter');
        if (genreSelect && filters.genres) {
            const currentValue = genreSelect.value;
            genreSelect.innerHTML = '<option value="all">Wszystkie gatunki</option>';
            filters.genres.forEach(genre => {
                const selected = currentValue === genre ? 'selected' : '';
                genreSelect.innerHTML += `<option value="${genre}" ${selected}>${genre}</option>`;
            });
        }
    }
}

// Глобальный экземпляр
const mangaAPI = new MangaCatalogAPI();

// Функция отображения карточек манги
function displayMangaCards(mangaItems, containerId = 'mangaGrid') {
    const container = document.getElementById(containerId);
    const noResults = document.getElementById('noResults');
    const counter = document.getElementById('resultsCount');
    
    if (!container) {
        console.error('Container not found:', containerId);
        return;
    }

    // Aktualizacja licznika
    if (counter) {
        const count = mangaItems ? mangaItems.length : 0;
        const total = localMangaDB.length;
        counter.textContent = count === total ? `Wszystkie: ${count}` : `Znaleziono: ${count} z ${total}`;
    }

    if (!mangaItems || mangaItems.length === 0) {
        container.innerHTML = '';
        if (noResults) {
            noResults.style.display = 'block';
        }
        return;
    }

    if (noResults) {
        noResults.style.display = 'none';
    }

    let html = '';
    mangaItems.forEach(manga => {
        const genres = manga.genres.split(', ').slice(0, 2);
        html += `
            <div class="manga-card-simple" onclick="window.location.href='manga-detail-modern.html?id=${manga.id}'">
                <div class="manga-cover-simple">
                    <img src="${manga.cover}" alt="${manga.title} cover" class="manga-cover-image" loading="lazy">
                </div>
                <div class="manga-info-simple">
                    <h4>${manga.title}</h4>
                    <div class="manga-tags">
                        ${genres.map(g => `<span class="manga-tag">${g}</span>`).join('')}
                    </div>
                    <div class="rating-simple">
                        <span class="stars-simple">${'⭐'.repeat(Math.floor(manga.rating))}</span>
                        <span class="rating-value-simple">${manga.rating}</span>
                    </div>
                    <div style="font-size: 12px; color: #888; margin-top: 4px;">${manga.year} • ${manga.status}</div>
                </div>
            </div>
        `;
    });

    container.innerHTML = html;
}

// Функция фильтрации (natychmiastowa, bez ładowania)
function filterManga() {
    const yearValue = document.getElementById('yearFilter')?.value || 'all';
    const searchValue = document.getElementById('searchInput')?.value || '';
    
    const filters = {
        genre: document.getElementById('genreFilter')?.value || 'all',
        status: document.getElementById('statusFilter')?.value || 'all',
        year: yearValue,
        search: searchValue
    };

    // Natychmiastowa filtracja lokalnych danych
    const filtered = localMangaDB.filter(manga => {
        if (filters.genre !== 'all' && !manga.genres.toLowerCase().includes(filters.genre.toLowerCase())) {
            return false;
        }
        if (filters.status !== 'all' && manga.status !== filters.status) {
            return false;
        }
        if (filters.year !== 'all' && manga.year !== filters.year) {
            return false;
        }
        if (filters.search && !manga.title.toLowerCase().includes(filters.search.toLowerCase())) {
            return false;
        }
        return true;
    });

    displayMangaCards(filtered);
}

// Сброс фильтров
function resetFilters() {
    const filterIds = ['genreFilter', 'statusFilter', 'yearFilter', 'searchInput'];
    filterIds.forEach(id => {
        const element = document.getElementById(id);
        if (element) {
            element.value = 'all';
        }
    });
    
    // Natychmiastowe wyświetlenie wszystkich
    displayMangaCards(localMangaDB);
    
    const counter = document.getElementById('resultsCount');
    if (counter) {
        counter.textContent = `Wszystkie: ${localMangaDB.length}`;
    }
}

// Alias dla kompatybilności wstecznej
function clearFilters() {
    resetFilters();
}

// Funkcja filtrowania po tagu (kliknięcie na tag w karcie)
function filterByTag(tag) {
    const genreFilter = document.getElementById('genreFilter');
    if (genreFilter) {
        // Mapowanie angielskich tagów na polskie nazwy
        const tagMapping = {
            'romance': 'Romans',
            'romantyka': 'Romans',
            'action': 'Akcja',
            'akcja': 'Akcja',
            'fantasy': 'Fantastyka',
            'comedy': 'Komedia',
            'komedia': 'Komedia',
            'drama': 'Dramat',
            'horror': 'Horror',
            'school': 'Szkolne',
            'szkoła': 'Szkolne',
            'ongoing': 'all',
            'w trakcie': 'all',
            'completed': 'all',
            'zakończone': 'all'
        };
        
        const mappedTag = tagMapping[tag.toLowerCase()] || tag;
        if (mappedTag !== 'all') {
            genreFilter.value = mappedTag;
            filterManga();
        }
    }
}

// Инициализация при загрузке страницы
document.addEventListener('DOMContentLoaded', function() {
    // Wyświetlamy wszystkie mangi natychmiast - bez ładowania
    displayMangaCards(localMangaDB);
    
    // Aktualizujemy licznik
    const counter = document.getElementById('resultsCount');
    if (counter) {
        counter.textContent = `Wszystkie: ${localMangaDB.length}`;
    }
});

// Экспорт для использования в других файлах
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { MangaCatalogAPI, filterManga, resetFilters, displayMangaCards };
}
