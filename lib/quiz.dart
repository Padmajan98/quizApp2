import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/questionscreen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/welcome_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> selectedAnswers = [];
  // Widget? activeScreen;
  var activeScreen = 'WelcomePage';
  //
  // @override
  // void initState() {
  //   activeScreen = WelcomePage(switchscreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'QuestionsPage';
    });
  }

  void chooseAnswer(answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'resultscreen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'QuestionsPage';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomePage(switchScreen);
    if (activeScreen == 'QuestionsPage') {
      screenWidget = QuestionsPage(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'resultscreen') {
      screenWidget = ResultScreen(
        choosenAnswer: selectedAnswers,
        restart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellow, Colors.red],
              begin: startalignment,
              end: endalignment),
        ),
        child: screenWidget,
        // activeScreen == 'WelcomePage'
        //     ? WelcomePage(switchScreen)
        //     : const QuestionsPage(),
      )),
    );
  }
}
