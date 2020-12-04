import 'package:flutter/material.dart';

import 'view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Dosis',
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Dosis',
            color: Colors.black,
          ),
          headline1: TextStyle(
            fontSize: 72.0,
            fontFamily: 'Dosis',
            fontWeight: FontWeight.w900,
            color: Color(0xFF1e1d1c),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
