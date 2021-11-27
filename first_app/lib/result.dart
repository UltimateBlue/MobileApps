import 'package:flutter/material.dart';

class FinalResult extends StatelessWidget {
  final int _finalScore;
  final VoidCallback resetApp;
  FinalResult(this._finalScore, this.resetApp);

  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(
          'You\'r score is ${_finalScore}!',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        TextButton(
          child: Text('Reset Test'),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.amber)),
          onPressed: resetApp,
        ),
      ]),
    );
  }
}
