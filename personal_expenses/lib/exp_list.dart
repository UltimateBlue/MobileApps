import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/transaction.dart';

class ExpList extends StatelessWidget {
  final List<Transaction> _transactions;
  ExpList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: SingleChildScrollView(
        child: Column(
          children: _transactions
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${e.title}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('${DateFormat.yMMMd().format(e.date)}',
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
      ),
    );
  }
}
