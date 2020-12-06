import 'package:flutter/material.dart';

import '../widgets/home_bottom_nav_bar.dart';
import '../widgets/home_floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeFloatingActionButton(),
      bottomNavigationBar: HomeBottomNavBar(),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
