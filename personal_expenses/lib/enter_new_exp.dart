import 'package:flutter/material.dart';
import './main.dart';
import './transaction.dart';

class EnterExp extends StatelessWidget {
  bool showInputPanel;
  MyHomePageState parent;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  EnterExp(this.showInputPanel, this.parent);

  @override
  Widget build(BuildContext context) {
    if (showInputPanel) {
      return Card(
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
                  parent.transactions.add(Transaction(
                      'tr' + (parent.transactions.length + 1).toString(),
                      titleController.text,
                      double.parse(amountController.text),
                      DateTime.now()));
                  parent.closeAddExpPopup();
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
      );
    } else {
      return Container();
    }
  }
}
