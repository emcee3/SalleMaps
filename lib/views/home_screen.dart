import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:salle_maps/views/map_screen.dart';
import 'package:salle_maps/views/list_screen.dart';

import 'package:salle_maps/view_models/poi_list_view_model.dart';
import 'package:salle_maps/view_models/poi_type_view_model.dart';

import 'package:salle_maps/widgets/home_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final POIListViewModel _poiListViewModel = POIListViewModel();
  final POITypeViewModel _poiTypeViewModel = POITypeViewModel();

  List<Widget> _screens;
  int _currentTabIndex = 0;

  void _selectTabIndex(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: _poiListViewModel),
          ChangeNotifierProvider.value(value: _poiTypeViewModel),
        ],
        child: MapScreen(),
      ),
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: _poiListViewModel),
          ChangeNotifierProvider.value(value: _poiTypeViewModel),
        ],
        child: ListScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Image.asset('assets/la_salle_maps_logo.png', width: 200.0),
        centerTitle: true,
      ),
      bottomNavigationBar: HomeBottomNavBar(onTabSelected: _selectTabIndex),
      // * IndexedStack prevents from loading the map over and over again
      body: IndexedStack(
        index: _currentTabIndex,
        children: _screens,
      ),
    );
  }
}
