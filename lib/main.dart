import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salle_maps/services/services.dart';
import 'package:salle_maps/views/login_screen.dart';
import 'package:salle_maps/views/profile_screen.dart';
import 'package:salle_maps/views/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authState,
        )
      ],
      child: MaterialApp(
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
        initialRoute: user == null ? '/login' : '/home',
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}
