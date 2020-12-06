import 'package:flutter/material.dart';

class HomeFloatingActionButton extends StatelessWidget {
  HomeFloatingActionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        print('FAB: pressed');
      },
      tooltip: 'Add marker',
      child: Icon(Icons.add),
      elevation: 2.0,
      backgroundColor: Colors.orange,
    );
  }
}

//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         tooltip: 'Add marker',
//         child: Icon(Icons.add),
//         elevation: 2.0,
//         backgroundColor: Colors.orange,
//       ),
