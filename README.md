# Quran Learning App 🕌

An open-source Flutter application designed to help foreigners learn the Quran through interactive lessons, pronunciation guides, translations, and quizzes.

## Features ✨

- 📖 **Learn Quranic Chapters (Surahs)** - Explore all chapters with Arabic text, transliteration, and English translations
- 🔤 **Arabic Letter Lessons** - Learn the 28 letters of the Arabic alphabet with pronunciation and examples
- 🎯 **Interactive Quizzes** - Test your knowledge with engaging quizzes and track your scores
- 📊 **Progress Tracking** - Monitor your learning progress and achievements
- 🌐 **Multiple Languages** - Translations and content in English
- 🎵 **Audio Support** - Listen to Quranic recitations (coming soon)
- 💾 **Local Database** - All data stored locally for offline access
- 📱 **User-Friendly Interface** - Beautiful and intuitive design

## Screenshots

(Screenshots would be added here)

## Tech Stack

- **Flutter 3.0+** - Cross-platform development
- **Dart** - Programming language
- **SQLite** - Local database with sqflite
- **Provider** - State management
- **Google Fonts** - Beautiful typography
- **AudioPlayers** - Audio playback (coming soon)

## Installation

### Prerequisites
- Flutter SDK (v3.0 or higher)
- Dart SDK (v3.0 or higher)
- Android Studio / Xcode (for mobile development)

### Clone the Repository

```bash
git clone https://github.com/ubaydaali/quran-learning-app.git
cd quran-learning-app
```

### Get Dependencies

```bash
flutter pub get
```

### Run the App

**On Android:**
```bash
flutter run -d android
```

**On iOS:**
```bash
flutter run -d ios
```

**On Web:**
```bash
flutter run -d chrome
```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── models/
│   └── quran_model.dart   # Data models
├── database/
│   └── database_helper.dart # SQLite database management
├── providers/
│   └── progress_provider.dart # State management
└── screens/
    ├── home_screen.dart   # Home/Dashboard
    ├── surahs_screen.dart # List of Surahs
    ├── surah_detail_screen.dart # Surah content
    ├── letters_screen.dart # Arabic letters
    ├── quiz_screen.dart   # Interactive quizzes
    └── profile_screen.dart # User progress
```

## Features in Detail

### 📖 Surah Learning
- View all 114 Surahs of the Quran
- Display verses with Arabic text, transliteration, and English translation
- Clean, readable interface with proper spacing

### 🔤 Letter Learning
- Learn all 28 Arabic letters
- Pronunciation guides and examples
- Interactive letter details dialog

### 🎯 Quiz System
- Answer questions about each Surah
- Automatic scoring (0-100%)
- Progress tracking and achievements
- Results summary with option to retry

### 📊 Progress Tracking
- View overall score and completed lessons
- See detailed learning history
- Track completion dates and scores

## Database Schema

### Tables
- **surahs** - Quranic chapters information
- **verses** - Individual verses with translations
- **letters** - Arabic alphabet letters
- **user_progress** - User's learning progress and scores

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Ways to Contribute
- Add more content (verses, translations)
- Improve UI/UX design
- Add audio recitation support
- Translate to more languages
- Bug fixes and optimizations
- Documentation improvements

## Development Roadmap

- [ ] Audio recitation playback
- [ ] More language translations
- [ ] Advanced progress analytics
- [ ] Offline synchronization
- [ ] Dark mode support
- [ ] Social sharing features
- [ ] Customizable learning paths
- [ ] Flashcard system

## License

This project is open source and available under the MIT License. See the LICENSE file for details.

## Acknowledgments

- Thanks to all Islamic scholars and educators
- Flutter community for excellent documentation
- Contributors and users who help improve this app

## Support

If you encounter any issues or have suggestions, please open an issue on GitHub.

## Contact

- GitHub: [@ubaydaali](https://github.com/ubaydaali)

---

Made with ❤️ for Islamic education

**Assalamu Alaikum! Happy Learning! 📚**
