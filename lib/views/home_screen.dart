import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salle_maps/views/profile_screen.dart';

import 'package:salle_maps/views/map_screen.dart';
import 'package:salle_maps/views/list_screen.dart';

import 'package:salle_maps/view_models/poi_list_view_model.dart';
import 'package:salle_maps/view_models/poi_type_view_model.dart';

import 'package:salle_maps/widgets/home_bottom_nav_bar.dart';
import 'package:salle_maps/widgets/home_floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    MultiProvider(
      providers: [
        ChangeNotifierProvider<POIListViewModel>(
            create: (_) => POIListViewModel()),
        ChangeNotifierProvider<POITypeViewModel>(
            create: (_) => POITypeViewModel()),
      ],
      child: MapScreen(),
    ),
    ProfileScreen(),
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
