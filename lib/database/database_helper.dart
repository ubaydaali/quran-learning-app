import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/quran_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'quran_learning.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE surahs(
        id INTEGER PRIMARY KEY,
        arabicName TEXT NOT NULL,
        englishName TEXT NOT NULL,
        versesCount INTEGER NOT NULL,
        meaning TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE verses(
        id INTEGER PRIMARY KEY,
        surahId INTEGER NOT NULL,
        verseNumber INTEGER NOT NULL,
        arabicText TEXT NOT NULL,
        englishTranslation TEXT NOT NULL,
        transliteration TEXT NOT NULL,
        FOREIGN KEY (surahId) REFERENCES surahs(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE letters(
        id INTEGER PRIMARY KEY,
        letter TEXT NOT NULL,
        englishName TEXT NOT NULL,
        pronunciation TEXT NOT NULL,
        example TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE user_progress(
        id INTEGER PRIMARY KEY,
        surahId INTEGER NOT NULL,
        isCompleted INTEGER NOT NULL,
        completedDate TEXT NOT NULL,
        score INTEGER NOT NULL,
        FOREIGN KEY (surahId) REFERENCES surahs(id)
      )
    ''');

    await _insertSampleData(db);
  }

  Future<void> _insertSampleData(Database db) async {
    final surahs = [
      {'arabicName': 'الفاتحة', 'englishName': 'Al-Fatihah', 'versesCount': 7, 'meaning': 'The Opening'},
      {'arabicName': 'البقرة', 'englishName': 'Al-Baqarah', 'versesCount': 286, 'meaning': 'The Cow'},
      {'arabicName': 'آل عمران', 'englishName': 'Aal-e-Imraan', 'versesCount': 200, 'meaning': 'The Family of Imraan'},
      {'arabicName': 'النساء', 'englishName': 'An-Nisa', 'versesCount': 176, 'meaning': 'The Women'},
      {'arabicName': 'المائدة', 'englishName': 'Al-Maidah', 'versesCount': 120, 'meaning': 'The Table'},
    ];

    for (int i = 0; i < surahs.length; i++) {
      await db.insert('surahs', {
        'id': i + 1,
        ...surahs[i],
      });
    }

    final verses = [
      {'surahId': 1, 'verseNumber': 1, 'arabicText': 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ', 'englishTranslation': 'In the name of Allah, the Most Gracious, the Most Merciful', 'transliteration': 'Bismillah ar-Rahman ar-Rahim'},
      {'surahId': 1, 'verseNumber': 2, 'arabicText': 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ', 'englishTranslation': 'All praise is due to Allah, Lord of all the worlds', 'transliteration': 'Alhamdu lillaahi rabbi alaalameena'},
    ];

    for (var verse in verses) {
      await db.insert('verses', verse);
    }

    final letters = [
      {'letter': 'ا', 'englishName': 'Alif', 'pronunciation': 'A', 'example': 'أسد (Lion)'},
      {'letter': 'ب', 'englishName': 'Ba', 'pronunciation': 'B', 'example': 'بيت (House)'},
      {'letter': 'ت', 'englishName': 'Ta', 'pronunciation': 'T', 'example': 'تمر (Date)'},
      {'letter': 'ث', 'englishName': 'Tha', 'pronunciation': 'TH', 'example': 'ثوب (Garment)'},
      {'letter': 'ج', 'englishName': 'Jim', 'pronunciation': 'J', 'example': 'جبل (Mountain)'},
    ];

    for (int i = 0; i < letters.length; i++) {
      await db.insert('letters', {
        'id': i + 1,
        ...letters[i],
      });
    }
  }

  Future<List<Surah>> getAllSurahs() async {
    final db = await database;
    final result = await db.query('surahs', orderBy: 'id');
    return result.map((map) => Surah.fromMap(map)).toList();
  }

  Future<Surah?> getSurahById(int id) async {
    final db = await database;
    final result = await db.query('surahs', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Surah.fromMap(result.first);
    }
    return null;
  }

  Future<List<Verse>> getVersesBySurah(int surahId) async {
    final db = await database;
    final result = await db.query(
      'verses',
      where: 'surahId = ?',
      whereArgs: [surahId],
      orderBy: 'verseNumber',
    );
    return result.map((map) => Verse.fromMap(map)).toList();
  }

  Future<List<QuranLetter>> getAllLetters() async {
    final db = await database;
    final result = await db.query('letters', orderBy: 'id');
    return result.map((map) => QuranLetter.fromMap(map)).toList();
  }

  Future<void> saveProgress(UserProgress progress) async {
    final db = await database;
    await db.insert(
      'user_progress',
      progress.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<UserProgress?> getProgress(int surahId) async {
    final db = await database;
    final result = await db.query(
      'user_progress',
      where: 'surahId = ?',
      whereArgs: [surahId],
    );
    if (result.isNotEmpty) {
      return UserProgress.fromMap(result.first);
    }
    return null;
  }

  Future<List<UserProgress>> getAllProgress() async {
    final db = await database;
    final result = await db.query('user_progress', orderBy: 'completedDate DESC');
    return result.map((map) => UserProgress.fromMap(map)).toList();
  }

  Future<void> initDatabase() async {
    await database;
  }
}