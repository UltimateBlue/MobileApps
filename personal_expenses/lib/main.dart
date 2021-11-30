import 'package:flutter/material.dart';
import './statefullbody.dart';

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

class MyHomePage extends StatelessWidget {
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
      body: StateFullBody(),
    );
  }
}
