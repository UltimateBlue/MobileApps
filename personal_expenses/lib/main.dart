import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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
class MyHomePage extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction('tr1', 'New Shoes', 19.5, DateTime.now()),
    Transaction('tr2', 'New Suits', 10.0, DateTime.now())
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _openAddExpPopup() {}

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
              Container(
                width: double.infinity,
                height: 150.0,
                margin: const EdgeInsets.all(10),
                child: const Card(
                  elevation: 5,
                  child: Center(
                    child: Text('Bars Place'),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      const Text(
                        'Enter new expense',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        keyboardType: TextInputType.name,
                        autofocus: true,
                        decoration: InputDecoration(label: Text('Exp Title')),
                        controller: titleController,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(label: Text('Emount')),
                        controller: amountController,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          transactions.add(Transaction(
                              'tr' + (transactions.length + 1).toString(),
                              titleController.text,
                              double.parse(amountController.text),
                              DateTime.now()));
                          // clear textFields
                          // close panel
                          // update UI
                        },
                        child: const Text('Submit'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red[500])),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: transactions
                    .map((e) => Container(
                          margin: const EdgeInsets.all(10),
                          width: double.infinity,
                          height: 100,
                          child: Card(
                            elevation: 5,
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      child: Center(
                                          child: Text(
                                        '${e.amount}\$',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${e.title}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              '${DateFormat.yMMMd().format(e.date)}',
                                              style: const TextStyle(
                                                  color: Colors.grey)),
                                        ]),
                                    FloatingActionButton(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.red[900],
                                        elevation: 0,
                                        onPressed: null,
                                        child: Icon(Icons.delete))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {}, //() => setState(() => _openAddExpPopup()),
        tooltip: 'Add New Expense',
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
