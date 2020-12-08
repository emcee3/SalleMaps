import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views/map_screen.dart';
import '../views/list_screen.dart';

import '../view_models/map_view_model.dart';

import '../widgets/home_bottom_nav_bar.dart';
import '../widgets/home_floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    ChangeNotifierProvider(
      create: (context) => MapViewModel(),
      child: MapScreen(),
    ),
    ListScreen(),
  ];
  int _currentTabIndex = 0;

  void _selectTabIndex(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeFloatingActionButton(),
      bottomNavigationBar: HomeBottomNavBar(onTabSelected: _selectTabIndex),
      // * IndexedStack prevents from loading the map over and over again
      body: IndexedStack(
        index: _currentTabIndex,
        children: _screens,
      ),
    );
  }
}
