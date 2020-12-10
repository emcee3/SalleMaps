import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Salle Maps',
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
          child: Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'assets/default_user.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: HomeFloatingActionButton(),
      bottomNavigationBar: HomeBottomNavBar(onTabSelected: _selectTabIndex),
      // * IndexedStack prevents from loading the map over and over again
      body: IndexedStack(
        index: _currentTabIndex,
        children: _screens,
      ),
    );
  }
}
