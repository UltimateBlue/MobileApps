import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questions = [
    {
      'question': 'what is your favorite color?',
      'answers': ['white', 'Blue', 'Black'],
      'scores': [1, 2, 3],
    },
    {
      'question': 'what is your favorite animal?',
      'answers': ['Cat', 'Dog', 'Elephent'],
      'scores': [1, 2, 3],
    },
    {
      'question': 'what is your favorite food?',
      'answers': ['Pizza', 'Spagetti', 'Meat'],
      'scores': [1, 2, 3],
    },
  ];

  int _idx = 0;
  int _finalScore = 0;

  void _btnHandler(int score) {
    _finalScore += score;
    setState(() {
      _idx++;
    });
  }

  void resetApp() {
    setState(() {
      _idx = 0;
      _finalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MyFirstApp'),
          backgroundColor: Colors.pink,
          foregroundColor: Colors.black,
        ),
        body: ((_idx < _questions.length)
            ? QuizWidget(
                _questions[_idx]['question'] as String,
                _questions[_idx]['answers'] as List<String>,
                _questions[_idx]['scores'] as List<int>,
                _btnHandler,
              )
            : FinalResult(_finalScore, resetApp)),
      ),
    );
  }
}
