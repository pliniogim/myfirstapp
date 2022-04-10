import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //List
  //  var questions = []
  //   'What\'s your favorite color?',
  //   'What\'s your favorite animal?',
  // ];

  //movida para cá para ser utilizada pela função _answerQuestion
  //abaixo de Build estava limitado o acesso por causa do scope
  //static const questions = [ o mesmo que abaixo
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 0}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 0},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Cat', 'score': 5},
        {'text': 'Lion', 'score': 8}
      ],
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': [
        {'text': 'Stephen', 'score': 3},
        {'text': 'Ruize', 'score': 3},
        {'text': 'Max', 'score': 3},
        {'text': 'None', 'score': 9}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //_totalScore = _totalScore + score;
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      // print(_questionIndex);
      // print(_totalScore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
