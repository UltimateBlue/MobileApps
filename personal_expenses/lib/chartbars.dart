import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';

class ChartBar extends StatelessWidget {
  final List<Transaction> _transactions;
  ChartBar(this._transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.0,
      margin: EdgeInsets.all(10),
      child: const Card(
        elevation: 5,
        child: Center(
          child: Text('Bars Place'),
        ),
      ),
    );
  }
}
