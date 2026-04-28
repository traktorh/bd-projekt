
📑Manga Desktop Platform
1. Cel Projektu
Stworzenie wydajnej, desktopowej platformy webowej do czytania mangi, która pozwala na zarządzanie dużymi bibliotekami plików graficznych i szybkie serwowanie ich użytkownikowi końcowemu.

2. Języki i Technologie
Frontend: HTML5, CSS3, JavaScript (Vanilla JS).
Backend: PHP 8.x.
Baza Danych: SQL (MySQL/MariaDB).
Środowisko: Serwer Apache (np. XAMPP).

3. Funkcjonalność Strony
Co może robić użytkownik?
Katalogowanie: Przeglądanie pełnej listy dostępnych tytułów w formie przejrzystej siatki (Grid).
Wyszukiwanie i Filtrowanie: Sortowanie mang według gatunków, autorów lub daty dodania.

Zaawansowany Czytnik (Desktop):
Przeglądanie stron za pomocą klawiatury (strzałki lewo/prawo).
Wybór trybu wyświetlania (jedna strona na środku ekranu lub pionowy scroll).
Skalowanie obrazu do wysokości lub szerokości monitora.

Zarządzanie Postępem: Możliwość oznaczenia mangi jako "Przeczytana" oraz śledzenie ostatniego odwiedzonego rozdziału (sesje PHP).

4. Architektura Systemowa i Przepływ Danych
Projekt opiera się na bezpośredniej komunikacji między systemem plików a bazą danych:
SQL przechowuje metadane (tytuły, opisy, relacje).
PHP zarządza logiką dostępu: sprawdza istnienie folderu z rozdziałem i generuje ścieżki do obrazów.

HTML/CSS buduje szkielet wyświetlania dostosowany do dużych rozdzielczości ekranów.

6. Drzewo Plików (Struktura Projektu)
Plaintext
/manga_reader_project
│
├── /assets                     # Zasoby frontendowe
│   ├── /css
│   │   ├── layout.css          # Główne style (Desktop-first)
│   │   └── reader.css          # Style czytnika (ciemny tryb, centrowanie)
│   ├── /js
│   │   ├── navigation.js       # Obsługa klawiatury i menu
│   │   └── ajax_loader.js      # Dynamiczne ładowanie rozdziałów
│   └── /img                    # Elementy interfejsu
│
├── /config                     # Zaplecze techniczne
│   └── database.php            # Konfiguracja PDO
│
├── /includes                   # Moduły wielokrotnego użytku
│   ├── navbar.php              # Górny pasek nawigacji
│   ├── sidebar.php             # Filtry gatunków
│   └── functions.php           # Logika PHP (np. skaner katalogów)
│
├── /manga_data                 # REPOZYTORIUM PLIKÓW (Struktura folderów)
│   └── /one-piece              # Slug mangi
│       ├── /vol_1              # Rozdział 1
│       │   ├── 001.png
│       │   ├── 002.png
│       └── cover.jpg           # Zdjęcie okładki
│
├── index.php                   # Katalog główny
├── title.php                   # Strona szczegółów mangi
├── reader.php                  # Silnik czytnika
└── schema.sql                  # Struktura bazy SQL
