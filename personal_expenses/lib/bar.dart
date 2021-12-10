import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final Map barValue;
  double total;

  // List<String> days = ['sun', 'mon', 'thu', 'wed', 'thr', 'fri', 'sat'];
  // int idx = DateTime.now().weekday;
  // final int i;

  Bar(this.barValue, this.total);

  @override
  Widget build(BuildContext context) {
    if (total == 0) total = 1;
    return Container(
      margin: EdgeInsets.all(10),
      width: 22,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              barValue['amount'].toStringAsFixed(1),
              style: TextStyle(fontSize: 10, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: 20,
            // height: 52,
            // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  width: 20,
                  height: 52,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  // height: 50.0 - (barValue['amount'] * 50 / total),
                ),
                Container(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    // padding: EdgeInsets.all(1),
                    width: 20,
                    height: barValue['amount'] * 50 / total,
                    decoration: BoxDecoration(
                        color: Colors.amber[300],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Text(
            barValue['day'],
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
