import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, required this.onPress, super.key});
  final String text;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              backgroundColor: const Color.fromARGB(255, 215, 97, 0),
              foregroundColor: Colors.white),
          child: Text(text)),
    );
  }
}
