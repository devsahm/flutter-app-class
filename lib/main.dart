import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ],
    },
    {
      'questionText': 'who\'s your favourite instructor ?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Samuel', 'score': 1},
        {'text': 'David', 'score': 1},
        {'text': 'Rita', 'score': 1}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore= 0;
  void _resetQuiz () {
    setState(() {
      _questionIndex =0;
     _totalScore= 0;
    });
     
  }
  void _answerQuestion(int score) {
    _totalScore  +=  score;
    setState(() {
      _questionIndex = _questionIndex + 1;

    });
    if (_questionIndex < _questions.length) {
      print('We have more question!');
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my First App'),
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
