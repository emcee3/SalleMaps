import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;

  HomeBottomNavBar({Key key, this.onTabSelected}) : super(key: key);

  @override
  _HomeBottomNavBar createState() => _HomeBottomNavBar();
}

class _HomeBottomNavBar extends State<HomeBottomNavBar> {
  int _currentIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF69ade4),
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SizedBox(
                height: 60.0,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () => _updateIndex(0),
                    child: Icon(
                      Icons.map,
                      size: 24.0,
                      color: _currentIndex == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
              width: 60.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
            ), // This is to separate the items from de FAB
            Expanded(
              child: SizedBox(
                height: 60.0,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () => _updateIndex(1),
                    child: Icon(
                      Icons.list,
                      size: 24.0,
                      color: _currentIndex == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
