import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './bar.dart';
import './transaction.dart';

class ChartBar extends StatelessWidget {
  final List<Transaction> _transactions;
  ChartBar(this._transactions);

  List<Map> barValues(List<Transaction> _transactions) {
    return List.generate(7, (index) {
      var day =
          DateFormat.E().format(DateTime.now().subtract(Duration(days: index)));
      double dayAmount = 0;
      for (var element in _transactions) {
        int difference = DateTime.now().difference(element.date).inDays;
        if (difference == index) {
          print(index);
          dayAmount += element.amount;
        }
        // else {
        // print('break $index');
        // break;
        // }
      }
      return {'day': day, 'amount': dayAmount};
    });
  }

  double totalExp(List<Transaction> _transactions) {
    double total = 0;
    for (var element in _transactions) {
      total += element.amount;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double total = totalExp(_transactions);
    // print(barValues(_transactions));
    return Container(
      width: double.infinity,
      // height: 150.0,
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                (barValues(_transactions).map((e) => Bar(e, total))).toList(),
          ),
        ),
      ),
    );
  }
}
