import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../models/quran_model.dart';
import '../providers/progress_provider.dart';

class QuizScreen extends StatefulWidget {
  final Surah surah;

  const QuizScreen({Key? key, required this.surah}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;
  int _score = 0;
  bool _answered = false;
  String? _selectedAnswer;
  late List<QuizQuestion> _questions;

  @override
  void initState() {
    super.initState();
    _questions = _generateQuestions();
  }

  List<QuizQuestion> _generateQuestions() {
    // Sample quiz questions about the surah
    return [
      QuizQuestion(
        question: 'What is the English meaning of "${widget.surah.arabicName}"?',
        options: [
          widget.surah.meaning,
          'The Light',
          'The Kingdom',
          'The Opened Gates',
        ],
        correctAnswer: widget.surah.meaning,
      ),
      QuizQuestion(
        question: 'How many verses does ${widget.surah.englishName} have?',
        options: [
          widget.surah.versesCount.toString(),
          '${widget.surah.versesCount + 10}',
          '${widget.surah.versesCount - 10}',
          '${widget.surah.versesCount * 2}',
        ],
        correctAnswer: widget.surah.versesCount.toString(),
      ),
      QuizQuestion(
        question: 'The Arabic name of this surah is:',
        options: [
          widget.surah.arabicName,
          'الإسراء',
          'مريم',
          'طه',
        ],
        correctAnswer: widget.surah.arabicName,
      ),
      QuizQuestion(
        question: 'Which Surah number is ${widget.surah.englishName}?',
        options: [
          widget.surah.id.toString(),
          '${widget.surah.id + 1}',
          '${widget.surah.id - 1}',
          '${widget.surah.id + 5}',
        ],
        correctAnswer: widget.surah.id.toString(),
      ),
      QuizQuestion(
        question: 'What is the literal translation of "Surah"?',
        options: [
          'Chapter',
          'Verse',
          'Letter',
          'Word',
        ],
        correctAnswer: 'Chapter',
      ),
    ];

    // Shuffle options
    _questions = _questions.map((q) {
      final shuffled = List<String>.from(q.options)..shuffle();
      return QuizQuestion(
        question: q.question,
        options: shuffled,
        correctAnswer: q.correctAnswer,
      );
    }).toList();

    return _questions;
  }

  void _answerQuestion(String answer) {
    if (!_answered) {
      setState(() {
        _answered = true;
        _selectedAnswer = answer;
        if (answer == _questions[_currentQuestion].correctAnswer) {
          _score += 20; // 5 questions = 100%
        }
      });
    }
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _answered = false;
        _selectedAnswer = null;
      });
    } else {
      _showResultsDialog();
    }
  }

  void _showResultsDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final percentage = _score;
        final provider = context.read<ProgressProvider>();

        // Save progress
        provider.saveProgress(widget.surah.id, percentage);

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Score Icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: percentage >= 70 ? Colors.green : Colors.orange,
                  ),
                  child: Icon(
                    percentage >= 70 ? Icons.check : Icons.star,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Title
                Text(
                  percentage >= 70 ? 'Excellent!' : 'Good Effort!',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                // Score
                Text(
                  'Your Score: $percentage%',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 12),

                // Message
                Text(
                  percentage >= 70
                      ? 'You have successfully completed this lesson!'
                      : 'Try again to improve your score!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text('Back'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            _currentQuestion = 0;
                            _score = 0;
                            _answered = false;
                            _selectedAnswer = null;
                            _questions = _generateQuestions();
                          });
                        },
                        child: const Text('Retry'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];
    final progress = (_currentQuestion + 1) / _questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - ${widget.surah.englishName}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Progress Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Question ${_currentQuestion + 1}/${_questions.length}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Score: $_score%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.green[700]!,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Question
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question Text
                  Text(
                    question.question,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Options
                  ...question.options.map((option) {
                    final isCorrect =
                        option == question.correctAnswer;
                    final isSelected = option == _selectedAnswer;

                    Color? backgroundColor;
                    Color? borderColor;

                    if (_answered) {
                      if (isSelected) {
                        if (isCorrect) {
                          backgroundColor = Colors.green[100];
                          borderColor = Colors.green;
                        } else {
                          backgroundColor = Colors.red[100];
                          borderColor = Colors.red;
                        }
                      } else if (isCorrect) {
                        backgroundColor = Colors.green[50];
                        borderColor = Colors.green;
                      }
                    } else if (isSelected) {
                      backgroundColor = Colors.blue[100];
                      borderColor = Colors.blue;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () => _answerQuestion(option),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            border: Border.all(
                              color: borderColor ?? Colors.grey[300]!,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: _answered
                                        ? (isSelected
                                            ? (isCorrect
                                                ? Colors.green[700]
                                                : Colors.red[700])
                                            : null)
                                        : null,
                                  ),
                                ),
                              ),
                              if (_answered)
                                Icon(
                                  isCorrect
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color: isCorrect ? Colors.green : Colors.red,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),

          // Next Button
          if (_answered)
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    _currentQuestion == _questions.length - 1
                        ? 'Finish'
                        : 'Next',
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}
