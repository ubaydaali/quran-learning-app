import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/database_helper.dart';
import '../models/quran_model.dart';
import '../providers/progress_provider.dart';
import 'surah_detail_screen.dart';

class SurahsScreen extends StatefulWidget {
  const SurahsScreen({Key? key}) : super(key: key);

  @override
  State<SurahsScreen> createState() => _SurahsScreenState();
}

class _SurahsScreenState extends State<SurahsScreen> {
  late Future<List<Surah>> _surahsFuture;

  @override
  void initState() {
    super.initState();
    _surahsFuture = DatabaseHelper().getAllSurahs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quranic Chapters (Surahs)'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Surah>>(
        future: _surahsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final surahs = snapshot.data ?? [];

          return ListView.builder(
            itemCount: surahs.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final surah = surahs[index];
              return Consumer<ProgressProvider>(
                builder: (context, provider, _) {
                  final isCompleted = provider.isSurahCompleted(surah.id);
                  final score = provider.getSurahScore(surah.id);

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurahDetailScreen(surah: surah),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      elevation: 2,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                            left: BorderSide(
                              color: isCompleted ? Colors.green : Colors.grey,
                              width: 4,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green[100],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  surah.id.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    surah.englishName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    surah.arabicName,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${surah.versesCount} verses',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isCompleted)
                              Column(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 28,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '$score%',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              )
                            else
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey[400],
                                size: 20,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}