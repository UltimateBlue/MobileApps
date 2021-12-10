// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './transaction.dart';
import './chartbars.dart';
import './enter_new_exp.dart';
import './exp_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PX',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(headline1: TextStyle(fontFamily: 'Quicksand')),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).primaryColorDark,
          foregroundColor: Colors.white,
          titleTextStyle:
              TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions = [
    // Transaction(
    //     'tr2', 'New Suits', 10.0, DateTime.now().subtract(Duration(days: 1))),
    // Transaction(
    //     'tr1', 'New Shoes', 19.5, DateTime.now().subtract(Duration(days: 4)))
  ];
  bool showInputPanel = false;

  void _removeItem(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    print(transactions
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList()
        .length);
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: EnterExp(_addNewEntry));
        });
  }

  void _addNewEntry(String title, double price, DateTime date) {
    setState(() {
      transactions.add(Transaction(
          'tr' + (transactions.length + 1).toString(), title, price, date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        backgroundColor: Theme.of(context).primaryColorDark,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () => {_startAddNewTransaction(context)},
              icon: Icon(Icons.add))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: const Text('Welcome User'),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
            const ListTile()
          ],
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ChartBar(transactions
                .where((element) => element.date
                    .isAfter(DateTime.now().subtract(Duration(days: 7))))
                .toList()),
            ExpList(transactions, _removeItem),
            FloatingActionButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              tooltip: 'Add New Expense',
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              child: const Icon(Icons.add),
            ),
          ]),
    );
  }
}
