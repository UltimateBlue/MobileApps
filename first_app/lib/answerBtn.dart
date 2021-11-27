import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class AnswerBtn extends StatelessWidget {
  String _ans;
  final VoidCallback _handler;
  AnswerBtn(this._ans, this._handler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(_ans),
        onPressed: _handler,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink),
            foregroundColor: MaterialStateProperty.all(Colors.black)),
      ),
    );
  }
}
