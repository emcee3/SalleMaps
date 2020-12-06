import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  HomeBottomNavBar({Key key}) : super(key: key);

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
                    onTap: () {
                      print('BottomNavVar: Map');
                    },
                    child: Icon(
                      Icons.map,
                      size: 24.0,
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
                    onTap: () {
                      print('BottomNavVar: List');
                    },
                    child: Icon(
                      Icons.list,
                      size: 24.0,
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
