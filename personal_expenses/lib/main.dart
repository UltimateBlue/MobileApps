import 'package:flutter/material.dart';
import 'package:personal_expenses/chartbars.dart';
import 'package:personal_expenses/exp_list.dart';
import './transaction.dart';
import 'enter_new_exp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PX',
      home: MyHomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MyHomePageState();
//   }
// }

// class MyHomePageState extends State<MyHomePage> {
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions = [
    Transaction('tr1', 'New Shoes', 19.5, DateTime.now()),
    Transaction('tr2', 'New Suits', 10.0, DateTime.now())
  ];

  bool showInputPanel = false;
  void closeAddExpPopup() {
    setState(() {
      showInputPanel = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: const Text('Welcome User'),
              decoration: BoxDecoration(color: Colors.red[800]),
            ),
            const ListTile()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ChartBar(),
              EnterExp(showInputPanel, this),
              ExpList(transactions),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          showInputPanel = true;
        }),
        tooltip: 'Add New Expense',
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
