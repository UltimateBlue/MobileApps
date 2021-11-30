import 'package:flutter/material.dart';
import './StateFullBody.dart';
import './transaction.dart';

class EnterExp extends StatelessWidget {
  bool showInputPanel;
  final Function closePopup;
  final Function(String title, String price) addNewEntry;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  EnterExp(this.showInputPanel, this.closePopup, this.addNewEntry);

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
                  addNewEntry(titleController.text, amountController.text);
                  closePopup();
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
