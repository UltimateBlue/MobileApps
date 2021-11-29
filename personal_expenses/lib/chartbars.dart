import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.0,
      margin: EdgeInsets.all(10),
      child: const Card(
        elevation: 5,
        child: Center(
          child: Text('Bars Place'),
        ),
      ),
    );
  }
}
