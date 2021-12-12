import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/transaction.dart';

class ExpList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function(String id) _removeItem;
  ExpList(this._transactions, this._removeItem);

  @override
  Widget build(BuildContext context) {
    // itemCount: _transactions.length;

    return _transactions.isEmpty
        ? LayoutBuilder(builder: (context, constrains) {
            return Column(
              children: [
                const Text("No Expenses yet!"),
                Container(
                    margin: const EdgeInsets.all(10),
                    height: constrains.maxHeight * .8,
                    width: constrains.maxWidth * .8,
                    child: Image.asset('assets/images/s.jpg',
                        fit: BoxFit.contain)),
              ],
            );
          })
        : ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: FittedBox(
                          child: Text(
                              '${_transactions[index].amount.toStringAsFixed(2)}\$'),
                        ),
                      ),
                    ),
                    title: Text(
                      _transactions[index].title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(_transactions[index].date),
                        style: const TextStyle(color: Colors.grey)),
                    trailing: FloatingActionButton(
                        backgroundColor: Colors.white,
                        foregroundColor: Theme.of(context).primaryColorDark,
                        elevation: 0,
                        onPressed: () => _removeItem(_transactions[index].id),
                        child: Icon(Icons.delete)),
                  ),
                ),
              );
            },
          );

    /*
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: 80,
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
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Center(
                                child: Text(
                              '${_transactions[index].amount.toStringAsFixed(2)}\$',
                              style: const TextStyle(color: Colors.white),
                            )),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _transactions[index].title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    DateFormat.yMMMd()
                                        .format(_transactions[index].date),
                                    style: const TextStyle(color: Colors.grey)),
                              ]),
                          FloatingActionButton(
                              backgroundColor: Colors.white,
                              foregroundColor:
                                  Theme.of(context).primaryColorDark,
                              elevation: 0,
                              onPressed: null,
                              child: Icon(Icons.delete))
                        ],
                      ),
                    ),
    */

    /*     child: SingleChildScrollView(
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
      */
  }
}
