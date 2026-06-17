// Comprehensive Quran Data for Quran Learning App
// This file contains sample data for all Surahs, Verses, and Arabic Letters

const List<Map<String, dynamic>> SURAHS_DATA = [
  {
    'id': 1,
    'arabicName': 'الفاتحة',
    'englishName': 'Al-Fatihah',
    'versesCount': 7,
    'meaning': 'The Opening'
  },
  {
    'id': 2,
    'arabicName': 'البقرة',
    'englishName': 'Al-Baqarah',
    'versesCount': 286,
    'meaning': 'The Cow'
  },
  {
    'id': 3,
    'arabicName': 'آل عمران',
    'englishName': 'Aal-e-Imraan',
    'versesCount': 200,
    'meaning': 'The Family of Imraan'
  },
  {
    'id': 4,
    'arabicName': 'النساء',
    'englishName': 'An-Nisa',
    'versesCount': 176,
    'meaning': 'The Women'
  },
  {
    'id': 5,
    'arabicName': 'المائدة',
    'englishName': 'Al-Maidah',
    'versesCount': 120,
    'meaning': 'The Table Spread'
  },
  {
    'id': 6,
    'arabicName': 'الأنعام',
    'englishName': 'Al-An\'am',
    'versesCount': 165,
    'meaning': 'The Cattle'
  },
  {
    'id': 7,
    'arabicName': 'الأعراف',
    'englishName': 'Al-A\'raf',
    'versesCount': 206,
    'meaning': 'The Heights'
  },
  {
    'id': 8,
    'arabicName': 'الأنفال',
    'englishName': 'Al-Anfal',
    'versesCount': 75,
    'meaning': 'The Spoils of War'
  },
  {
    'id': 9,
    'arabicName': 'التوبة',
    'englishName': 'At-Tawbah',
    'versesCount': 129,
    'meaning': 'The Repentance'
  },
  {
    'id': 10,
    'arabicName': 'يونس',
    'englishName': 'Yunus',
    'versesCount': 109,
    'meaning': 'Jonah'
  },
];

const List<Map<String, dynamic>> VERSES_DATA = [
  // Surah Al-Fatihah (1)
  {
    'surahId': 1,
    'verseNumber': 1,
    'arabicText': 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
    'englishTranslation': 'In the name of Allah, the Most Gracious, the Most Merciful',
    'transliteration': 'Bismillah ar-Rahman ar-Rahim'
  },
  {
    'surahId': 1,
    'verseNumber': 2,
    'arabicText': 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    'englishTranslation': 'All praise is due to Allah, Lord of all the worlds',
    'transliteration': 'Alhamdu lillaahi rabbi alaalameena'
  },
  {
    'surahId': 1,
    'verseNumber': 3,
    'arabicText': 'الرَّحْمَٰنِ الرَّحِيمِ',
    'englishTranslation': 'The Most Gracious, the Most Merciful',
    'transliteration': 'Ar-Rahman ar-Rahim'
  },
  {
    'surahId': 1,
    'verseNumber': 4,
    'arabicText': 'مَالِكِ يَوْمِ الدِّينِ',
    'englishTranslation': 'Master of the Day of Judgment',
    'transliteration': 'Malik yawm ad-Din'
  },
  {
    'surahId': 1,
    'verseNumber': 5,
    'arabicText': 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
    'englishTranslation': 'You alone we worship, and You alone we ask for help',
    'transliteration': 'Iyyaka na\'budu wa iyyaka nasta\'een'
  },
  {
    'surahId': 1,
    'verseNumber': 6,
    'arabicText': 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
    'englishTranslation': 'Guide us to the Straight Path',
    'transliteration': 'Ihdi-na as-sirat al-mustaqim'
  },
  {
    'surahId': 1,
    'verseNumber': 7,
    'arabicText': 'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
    'englishTranslation': 'The path of those upon whom You have bestowed favor, not of those who have evoked Your anger or of those who are astray',
    'transliteration': 'Sirat al-ladhina an\'amta alayhim ghayri al-maghdub alayhim wa la ad-dallin'
  },
];

const List<Map<String, dynamic>> ARABIC_LETTERS_DATA = [
  {
    'letter': 'ا',
    'englishName': 'Alif',
    'pronunciation': 'A',
    'example': 'أسد (Lion)'
  },
  {
    'letter': 'ب',
    'englishName': 'Ba',
    'pronunciation': 'B',
    'example': 'بيت (House)'
  },
  {
    'letter': 'ت',
    'englishName': 'Ta',
    'pronunciation': 'T',
    'example': 'تمر (Date)'
  },
  {
    'letter': 'ث',
    'englishName': 'Tha',
    'pronunciation': 'TH',
    'example': 'ثوب (Garment)'
  },
  {
    'letter': 'ج',
    'englishName': 'Jim',
    'pronunciation': 'J',
    'example': 'جبل (Mountain)'
  },
  {
    'letter': 'ح',
    'englishName': 'Ha',
    'pronunciation': 'H (emphatic)',
    'example': 'حمار (Donkey)'
  },
  {
    'letter': 'خ',
    'englishName': 'Kha',
    'pronunciation': 'KH',
    'example': 'خيل (Horses)'
  },
  {
    'letter': 'د',
    'englishName': 'Dal',
    'pronunciation': 'D',
    'example': 'دراسة (Study)'
  },
  {
    'letter': 'ذ',
    'englishName': 'Dhal',
    'pronunciation': 'DH',
    'example': 'ذهب (Gold)'
  },
  {
    'letter': 'ر',
    'englishName': 'Ra',
    'pronunciation': 'R',
    'example': 'رمل (Sand)'
  },
  {
    'letter': 'ز',
    'englishName': 'Za',
    'pronunciation': 'Z',
    'example': 'زيت (Oil)'
  },
  {
    'letter': 'س',
    'englishName': 'Sin',
    'pronunciation': 'S',
    'example': 'سمك (Fish)'
  },
  {
    'letter': 'ش',
    'englishName': 'Shin',
    'pronunciation': 'SH',
    'example': 'شمس (Sun)'
  },
  {
    'letter': 'ص',
    'englishName': 'Sad',
    'pronunciation': 'S (emphatic)',
    'example': 'صبر (Patience)'
  },
  {
    'letter': 'ض',
    'englishName': 'Dad',
    'pronunciation': 'D (emphatic)',
    'example': 'ضرب (Strike)'
  },
  {
    'letter': 'ط',
    'englishName': 'Tah',
    'pronunciation': 'T (emphatic)',
    'example': 'طعام (Food)'
  },
  {
    'letter': 'ظ',
    'englishName': 'Zah',
    'pronunciation': 'Z (emphatic)',
    'example': 'ظهر (Back)'
  },
  {
    'letter': 'ع',
    'englishName': 'Ain',
    'pronunciation': 'Deep guttural sound',
    'example': 'علم (Knowledge)'
  },
  {
    'letter': 'غ',
    'englishName': 'Ghain',
    'pronunciation': 'GH',
    'example': 'غنم (Sheep)'
  },
  {
    'letter': 'ف',
    'englishName': 'Fa',
    'pronunciation': 'F',
    'example': 'فرس (Horse)'
  },
  {
    'letter': 'ق',
    'englishName': 'Qaf',
    'pronunciation': 'Q',
    'example': 'قمر (Moon)'
  },
  {
    'letter': 'ك',
    'englishName': 'Kaf',
    'pronunciation': 'K',
    'example': 'كتاب (Book)'
  },
  {
    'letter': 'ل',
    'englishName': 'Lam',
    'pronunciation': 'L',
    'example': 'لسان (Tongue)'
  },
  {
    'letter': 'م',
    'englishName': 'Meem',
    'pronunciation': 'M',
    'example': 'ماء (Water)'
  },
  {
    'letter': 'ن',
    'englishName': 'Noon',
    'pronunciation': 'N',
    'example': 'نور (Light)'
  },
  {
    'letter': 'ه',
    'englishName': 'Ha',
    'pronunciation': 'H',
    'example': 'هدية (Gift)'
  },
  {
    'letter': 'و',
    'englishName': 'Waw',
    'pronunciation': 'W',
    'example': 'وردة (Rose)'
  },
  {
    'letter': 'ي',
    'englishName': 'Ya',
    'pronunciation': 'Y',
    'example': 'يد (Hand)'
  },
];

// Helper function to get data
Map<String, List<Map<String, dynamic>>> getQuranData() {
  return {
    'surahs': SURAHS_DATA,
    'verses': VERSES_DATA,
    'letters': ARABIC_LETTERS_DATA,
  };
}
