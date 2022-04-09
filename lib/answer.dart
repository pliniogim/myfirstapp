import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //ponteiro para uma função (callback) função _answerQuestion de main
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width double.infinity para todo o espaço
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green, // background
          onPrimary: Colors.white, // foreground
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
