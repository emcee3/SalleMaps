import 'package:flutter/material.dart';
import 'package:salle_maps/services/services.dart';
import 'package:salle_maps/views/login_screen.dart';
import 'package:salle_maps/views/profile_screen.dart';
import 'package:salle_maps/views/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Global.title,
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
          headline4: TextStyle(
            fontSize: 35.0,
            fontFamily: 'Dosis',
            fontWeight: FontWeight.w600,
            color: Color(0xFF1e1d1c),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
