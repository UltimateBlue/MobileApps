import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class QuestionTxt extends StatelessWidget {
  final String _question;

  QuestionTxt(this._question);

  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _question,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
      width: double.infinity,
      margin: EdgeInsets.all(10),
    );
  }
}
