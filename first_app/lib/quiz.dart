import 'package:flutter/material.dart';

import 'answerBtn.dart';
import 'question.dart';

class QuizWidget extends StatelessWidget {
  final List<String> _btns;
  final String _question;
  final List<int> _scores;
  final Function _btnHandler;

  QuizWidget(this._question, this._btns, this._scores, this._btnHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        QuestionTxt(_question),
        ...(_btns).asMap().entries.map((entry) {
          int idx = entry.key;
          String ans = entry.value;
          return AnswerBtn(ans, () => _btnHandler(_scores[idx]));
        }).toList()
      ],
    ));
  }
}
