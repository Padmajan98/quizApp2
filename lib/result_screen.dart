import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswer,required this.restart});
  final List<String> choosenAnswer;
  final void Function() restart;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'useranswer': choosenAnswer[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final summaryData = getSummary();
    final numCorrectQuestion = summaryData.where((data) {
      return data['useranswer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 150),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
              'you have answerd $numCorrectQuestion out of $numTotalQuestion questions correctly'),
          QuestionSummary(getSummary()),
          TextButton(onPressed: restart, child: const Text('Restart'))
        ]),
      ),
    );
  }
}
