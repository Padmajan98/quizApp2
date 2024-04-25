import 'package:flutter/material.dart';

const startalignment = Alignment.topLeft;
const endalignment = Alignment.bottomRight;

class WelcomePage extends StatelessWidget {
  const WelcomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Opacity(
          opacity: 0.4,
          child: Image(
              image: AssetImage('assets/images/quiz-logo.png'),
              width: 400,
              height: 300),
        ),
        const SizedBox(height: 70, width: double.infinity),
        const Text(
          'Learn Flutter The FunWay!',
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        ElevatedButton.icon(
            onPressed: startQuiz,
            label: const Text('Start'),
            icon: const Icon(Icons.arrow_right_alt))
      ],
    );
  }
}
