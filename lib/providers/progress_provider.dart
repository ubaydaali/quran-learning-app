import 'package:flutter/material.dart';
import '../models/quran_model.dart';
import '../database/database_helper.dart';

class ProgressProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<UserProgress> _progressList = [];

  List<UserProgress> get progressList => _progressList;

  ProgressProvider() {
    loadAllProgress();
  }

  Future<void> loadAllProgress() async {
    _progressList = await _dbHelper.getAllProgress();
    notifyListeners();
  }

  Future<void> saveProgress(int surahId, int score) async {
    final progress = UserProgress(
      id: surahId,
      surahId: surahId,
      isCompleted: score >= 70,
      completedDate: DateTime.now(),
      score: score,
    );

    await _dbHelper.saveProgress(progress);
    await loadAllProgress();
  }

  int getTotalScore() {
    if (_progressList.isEmpty) return 0;
    int total = 0;
    for (var progress in _progressList) {
      total += progress.score;
    }
    return (total / _progressList.length).round();
  }

  int getCompletedSurahs() {
    return _progressList.where((p) => p.isCompleted).length;
  }

  bool isSurahCompleted(int surahId) {
    try {
      return _progressList.firstWhere((p) => p.surahId == surahId).isCompleted;
    } catch (e) {
      return false;
    }
  }

  int? getSurahScore(int surahId) {
    try {
      return _progressList.firstWhere((p) => p.surahId == surahId).score;
    } catch (e) {
      return null;
    }
  }
}