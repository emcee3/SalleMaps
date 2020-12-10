import 'package:flutter/material.dart';
import 'package:salle_maps/widgets/home_input_search.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreen createState() => new _ListScreen();
}

class _ListScreen extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          HomeInputSearch(),
          Divider(color: Colors.grey, thickness: 1),
        ],
      ),
    );
  }
}
