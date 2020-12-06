import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreen createState() => new _ListScreen();
}

class _ListScreen extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is not a list'),
      ),
    );
  }
}
