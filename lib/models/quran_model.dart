class Surah {
  final int id;
  final String arabicName;
  final String englishName;
  final int versesCount;
  final String meaning;

  Surah({
    required this.id,
    required this.arabicName,
    required this.englishName,
    required this.versesCount,
    required this.meaning,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'arabicName': arabicName,
      'englishName': englishName,
      'versesCount': versesCount,
      'meaning': meaning,
    };
  }

  factory Surah.fromMap(Map<String, dynamic> map) {
    return Surah(
      id: map['id'],
      arabicName: map['arabicName'],
      englishName: map['englishName'],
      versesCount: map['versesCount'],
      meaning: map['meaning'],
    );
  }
}

class Verse {
  final int id;
  final int surahId;
  final int verseNumber;
  final String arabicText;
  final String englishTranslation;
  final String transliteration;

  Verse({
    required this.id,
    required this.surahId,
    required this.verseNumber,
    required this.arabicText,
    required this.englishTranslation,
    required this.transliteration,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'surahId': surahId,
      'verseNumber': verseNumber,
      'arabicText': arabicText,
      'englishTranslation': englishTranslation,
      'transliteration': transliteration,
    };
  }

  factory Verse.fromMap(Map<String, dynamic> map) {
    return Verse(
      id: map['id'],
      surahId: map['surahId'],
      verseNumber: map['verseNumber'],
      arabicText: map['arabicText'],
      englishTranslation: map['englishTranslation'],
      transliteration: map['transliteration'],
    );
  }
}

class QuranLetter {
  final int id;
  final String letter;
  final String englishName;
  final String pronunciation;
  final String example;

  QuranLetter({
    required this.id,
    required this.letter,
    required this.englishName,
    required this.pronunciation,
    required this.example,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'letter': letter,
      'englishName': englishName,
      'pronunciation': pronunciation,
      'example': example,
    };
  }

  factory QuranLetter.fromMap(Map<String, dynamic> map) {
    return QuranLetter(
      id: map['id'],
      letter: map['letter'],
      englishName: map['englishName'],
      pronunciation: map['pronunciation'],
      example: map['example'],
    );
  }
}

class UserProgress {
  final int id;
  final int surahId;
  final bool isCompleted;
  final DateTime completedDate;
  final int score;

  UserProgress({
    required this.id,
    required this.surahId,
    required this.isCompleted,
    required this.completedDate,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'surahId': surahId,
      'isCompleted': isCompleted ? 1 : 0,
      'completedDate': completedDate.toIso8601String(),
      'score': score,
    };
  }

  factory UserProgress.fromMap(Map<String, dynamic> map) {
    return UserProgress(
      id: map['id'],
      surahId: map['surahId'],
      isCompleted: map['isCompleted'] == 1,
      completedDate: DateTime.parse(map['completedDate']),
      score: map['score'],
    );
  }
}