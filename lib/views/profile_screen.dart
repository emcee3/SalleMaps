import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreen createState() => new _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Positioned.fill(
                    top: -50,
                    child: Image.asset(
                      'assets/roshar_map.jpeg', // This is a placeholder
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: (screenWidth / 2) - 50,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/default_user.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              title: Text(
                'Name',
                style: Theme.of(context).textTheme.headline5,
              ),
              subtitle: Text(
                'John Doe',
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: IconButton(
                icon: FaIcon(FontAwesomeIcons.solidEdit),
                splashColor: Colors.transparent,
                onPressed: () {},
              ),
            ),
            ListTile(
              title: Text(
                'Email',
                style: Theme.of(context).textTheme.headline5,
              ),
              subtitle: Text(
                FirebaseAuth.instance.currentUser.email,
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: IconButton(
                icon: FaIcon(FontAwesomeIcons.solidEdit),
                splashColor: Colors.transparent,
                onPressed: () {},
              ),
            ),
            ListTile(
              title: Text(
                'Password',
                style: Theme.of(context).textTheme.headline5,
              ),
              trailing: IconButton(
                icon: FaIcon(FontAwesomeIcons.solidEdit),
                splashColor: Colors.transparent,
                onPressed: () {},
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text('Theme', style: Theme.of(context).textTheme.headline5),
                  themeListTile(),
                ],
              ),
            ),
            // ListTile(
            //   title: Row(
            //     children: [
            //       Text('Theme', style: Theme.of(context).textTheme.headline5),
            //       Expanded(
            //         child: Align(
            //           alignment: Alignment.centerRight,
            //           child: ToggleSwitch(
            //             minWidth: 90.0,
            //             minHeight: 50.0,
            //             cornerRadius: 100.0,
            //             fontSize: 16.0,
            //             iconSize: 20.0,
            //             initialLabelIndex: 0,
            //             icons: [
            //               FontAwesomeIcons.solidSun,
            //               FontAwesomeIcons.mobileAlt,
            //               FontAwesomeIcons.solidMoon,
            //             ],
            //             labels: ['Light', 'System', 'Dark'],
            //             activeBgColor: Color(0xFF69ade4),
            //             activeFgColor: Colors.black,
            //             inactiveBgColor: Colors.grey,
            //             inactiveFgColor: Colors.black,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  themeListTile() {
    final Map<dynamic, Widget> options = Map.unmodifiable(
      {
        'system': Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.brightness_4),
            SizedBox(width: 6),
            Text('System'),
          ],
        ),
        'Light': Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.brightness_low),
            SizedBox(width: 6),
            Text('Light'),
          ],
        ),
        'Dark': Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.brightness_3),
            SizedBox(width: 6),
            Text('Dark'),
          ],
        ),
      },
    );

    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: CupertinoSlidingSegmentedControl(
          groupValue: 'system',
          children: options,
          onValueChanged: (value) {},
          thumbColor: Color(0xFF69ade4),
        ),
      ),
    );
  }
}
