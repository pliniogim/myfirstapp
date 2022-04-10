// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  // const Result({Key? key}) : super(key: key);
  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = "You are awesome and innocent";
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 16) {
      resultText = "You are strange";
    } else {
      resultText = "You are so bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            //2 tipos para style
            //style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.black)
            //style: TextButton.styleFrom(...)
            //OutlinedButton.styleFrom or OutlinedButton{ style: Border}
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: resetHandler,
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
