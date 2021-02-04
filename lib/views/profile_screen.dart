import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:salle_maps/services/globals.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreen createState() => new _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  Color _bgColor = Color(0xFF69ade4);

  void changeColor(Color color) => setState(() => _bgColor = color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F6),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                GestureDetector(
                  child: Container(
                    color: _bgColor,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          titlePadding: const EdgeInsets.all(0.0),
                          contentPadding: const EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          content: SingleChildScrollView(
                            child: SlidePicker(
                              pickerColor: _bgColor,
                              onColorChanged: changeColor,
                              paletteType: PaletteType.rgb,
                              enableAlpha: false,
                              displayThumbColor: true,
                              showLabel: false,
                              showIndicator: true,
                              indicatorBorderRadius:
                                  const BorderRadius.vertical(
                                top: const Radius.circular(25.0),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/default_user.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'Email',
                style: Theme.of(context).textTheme.headline5,
              ),
              subtitle: Text(
                FirebaseAuth.instance.currentUser.email,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title:
                  Text('Theme', style: Theme.of(context).textTheme.headline5),
              subtitle: Row(
                children: [
                  themeListTile(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Text(
                'logout',
                style: Theme.of(context).textTheme.headline6,
              ),
              color: Colors.red,
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }

  themeListTile() {
    final Map<dynamic, Widget> options = Map.unmodifiable(
      {
        Global.systemTheme: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.brightness_4),
              Text('System'),
            ],
          ),
        ),
        Global.lightTheme: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.brightness_low),
              Text('Light'),
            ],
          ),
        ),
        Global.darkTheme: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.brightness_3),
              Text('Dark'),
            ],
          ),
        ),
      },
    );

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: CupertinoSlidingSegmentedControl(
          groupValue: 'system',
          children: options,
          onValueChanged: (value) {
            print(value);
          },
          thumbColor: Color(0xFF69ade4),
        ),
      ),
    );
  }
}
