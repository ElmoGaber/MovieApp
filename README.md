# MovieApp - Flutter Movie Discovery & Details

![License](https://img.shields.io/badge/License-MIT-yellow.svg)
![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue)
![TMDB](https://img.shields.io/badge/API-TMDB-red)

**A modern, clean Flutter mobile application** for discovering movies, searching, viewing details, trailers, cast information, and managing favorites — powered by The Movie Database (TMDB) API.

Beautiful UI, smooth navigation, responsive design, and offline favorites support.

---

## ✨ Features

- Browse popular, top-rated, now playing, and upcoming movies  
- Powerful search with real-time suggestions  
- Detailed movie screen: overview, genres, runtime, rating, release date, cast & crew  
- YouTube trailer playback integration  
- Add/remove movies to favorites (persistent storage)  
- Favorites screen with grid/list view  
- Clean Material 3 design with dark mode support  
- Responsive layout for phones and tablets  
- Loading states, error handling, and retry mechanisms  
- Cached images using cached_network_image  
- Well-structured architecture with separation of concerns  

---

## 🚀 Quick Start

### Prerequisites

- Flutter SDK (3.0+)  
- Android Studio / VS Code with Flutter & Dart extensions  
- TMDB API key (get it from https://www.themoviedb.org/)

### Setup

1. Clone the repository  
   ```bash
   git clone https://github.com/ElmoGaber/MovieApp.git
   cd MovieApp
   ```
```
Install dependenciesBashflutter pub get
Add your TMDB API key
Open lib/core/constants/api_constants.dart (or create if missing)
Set: const String tmdbApiKey = 'YOUR_API_KEY_HERE';
```

Run the appBashflutter run


## 🛠 Tech Stack

Framework: Flutter 3.x
Language: Dart
State Management: Provider (or Riverpod — depending on your implementation)
Networking: http / dio
API: The Movie Database (TMDB) v3 API
Image Caching: cached_network_image
Video Playback: youtube_player_flutter (for trailers)
Storage: shared_preferences or hive (for favorites)
UI: Material 3 + custom themes
Navigation: GoRouter / Navigator 2.0 (or classic Navigator)
Architecture: Clean / Feature-first structure


## 📱 Screens Overview

Home Screen
Categories carousel (Popular, Top Rated, etc.)
Horizontal movie lists
Search bar

Search Screen
Real-time search with debounce
Grid or list results

Movie Details Screen
Hero image with gradient overlay
Title, rating, genres, overview
Cast list (horizontal scroll)
Trailer button

Favorites Screen
Grid of saved movies
Remove / view options


```
📁 Project Structure
textMovieApp/
├── android/              # Android platform files
├── ios/                  # iOS platform files
├── web/                  # Web support (optional)
├── assets/               # Images, fonts, icons
├── lib/                  # Main source code
│   ├── core/             # Constants, utils, theme, di
│   ├── features/         # Feature-based folders (home, search, details, favorites)
│   ├── models/           # Data models (Movie, Cast, etc.)
│   ├── services/         # API service, local storage
│   ├── widgets/          # Reusable UI components
│   └── main.dart
├── test/                 # Unit & widget tests
├── pubspec.yaml
├── analysis_options.yaml
├── .metadata
├── README.md
└── LICENSE
```
## 🎯 Learning / Showcase Points

Effective use of FutureBuilder / StreamBuilder for async data
Proper error handling and user feedback
Clean separation between UI, business logic, and data layer
Responsive & adaptive layouts
Hero animations between screens
Custom card widgets with shadows and rounded corners
Theme management (light/dark)
Dependency injection basics
API key security awareness (never commit real keys)
Good README & project organization
