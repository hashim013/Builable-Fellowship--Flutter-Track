import 'package:builable_quiz_app/screens/questions_screen.dart';
import 'package:builable_quiz_app/screens/start_screen.dart';
import 'package:builable_quiz_app/screens/result_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen; // using widget as a variable, activescreen can be null
  int score = 0;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onQuizComplete);
    });
  }

  void onQuizComplete(int finalScore, int totalQuestions) {
    setState(() {
      score = finalScore;
      activeScreen = ResultScreen(
        score: score,
        total: totalQuestions,
        restartQuiz: restartQuiz,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      score = 0;
      activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 139, 212, 195),
                Color.fromARGB(235, 0, 0, 0),
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
