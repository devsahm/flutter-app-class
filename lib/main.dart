import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },

       {
        'questionText': 'what\'s your favourite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },

       {
        'questionText': 'who\'s your favourite instructor ?',
        'answers': ['Max', 'Samuel', 'David', 'Rita'],
      },

     
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),

           ...(questions[_questionIndex]['answers'] as List<String>)
           .map((answer) {
             return Answer(_answerQuestion, answer);  
           }).toList()
          ],
        ),
      ),
    );
  }
}
