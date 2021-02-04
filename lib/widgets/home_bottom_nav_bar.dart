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
    List<Widget> _navigationButtons =
        List.generate(2, (index) => _buildNavigationButton(index));

    return BottomAppBar(
      color: Color(0xFF69ade4),
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _navigationButtons,
        ),
      ),
    );
  }

  Widget _buildNavigationButton(int index) {
    return Expanded(
      child: SizedBox(
        height: 60.0,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => _updateIndex(index),
            child: Icon(
              index == 0 ? Icons.map : Icons.list,
              size: 24.0,
              color: _currentIndex == index ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
