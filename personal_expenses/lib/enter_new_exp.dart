import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EnterExp extends StatefulWidget {
  final Function(String title, double price, DateTime date) addNewEntry;

  EnterExp(this.addNewEntry, {Key? key}) : super(key: key);

  @override
  State<EnterExp> createState() => _EnterExpState();
}

class _EnterExpState extends State<EnterExp> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  // late final FocusNode focusNode = FocusNode(
  //   onKeyEvent: (node, event) {
  //     openDatePicker(context);
  //   },
  // );

  // focusNode.addListener(){
  //   if(focusNode.hasFocus){
  //   }
  // }

  void addToList() {
    if (titleController.text.isEmpty ||
        amountController.text.isEmpty ||
        !(double.parse(amountController.text) > 0) ||
        dateController.text.isEmpty) return;

    widget.addNewEntry(titleController.text,
        double.parse(amountController.text), selectedDate);
    Navigator.of(context).pop();
  }

  void openDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            firstDate: DateTime(2021),
            initialDate: DateTime.now(),
            lastDate: DateTime(2022))
        .then((value) {
      if (value != null) {
        dateController.text = DateFormat.yMMMd().format(value);
        // selectedDate = DateFormat.yMMMd().format(value) as DateTime;
        selectedDate = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const Text(
            'Enter new expense',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            keyboardType: TextInputType.text,
            autofocus: true,
            decoration: const InputDecoration(label: Text('Title')),
            controller: titleController,
            textInputAction: TextInputAction.next,
            // onSubmitted: (_) => addToList(),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(label: Text('Emount')),
            controller: amountController,
            textInputAction: TextInputAction.next,
            // onSubmitted: (_) => addToList(),
          ),
          TextField(
            keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(label: Text('Date')),
            controller: dateController,
            onTap: () => openDatePicker(context),
            // focusNode: focusNode,

            // onSubmitted: (_) => addToList(),
          ),
          ElevatedButton(
            onPressed: addToList,
            child: const Text('Submit'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red[500])),
          )
        ],
      ),
    );
  }
}
