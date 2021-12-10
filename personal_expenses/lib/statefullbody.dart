// ignore_for_file: file_names
/*
import 'package:flutter/material.dart';
import './transaction.dart';

import './chartbars.dart';
import './enter_new_exp.dart';
import './exp_list.dart';

class StateFullBody extends StatefulWidget {
  const StateFullBody({Key? key}) : super(key: key);
  @override
  StateFullBodyState createState() => StateFullBodyState();
}

class StateFullBodyState extends State<StateFullBody> {
  List<Transaction> transactions = [
    Transaction('tr1', 'New Shoes', 19.5, DateTime.now()),
    Transaction('tr2', 'New Suits', 10.0, DateTime.now())
  ];
  bool showInputPanel = false;

  void showNewEntryPanel() {
    if (showInputPanel) {
      setState(() {});
    }
  }

  void closeAddExpPopup() {
    setState(() {
      showInputPanel = false;
    });
  }

  void addNewEntry(String title, double price) {
    transactions.add(Transaction('tr' + (transactions.length + 1).toString(),
        title, price, DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChartBar(transactions),
          EnterExp(showInputPanel, closeAddExpPopup, addNewEntry),
          ExpList(transactions),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                showInputPanel = true;
              });
            },
            tooltip: 'Add New Expense',
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
        ]);
  }
}
*/