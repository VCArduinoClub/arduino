import 'package:flutter/material.dart';
import 'package:ino_arduino/presets.dart';
import 'package:ino_arduino/routes/lesson1_page.dart';
import 'package:ino_arduino/routes/lesson2_page.dart';
import 'package:ino_arduino/routes/lesson3_page.dart';
import 'package:ino_arduino/routes/lesson4_page.dart';
import 'package:ino_arduino/routes/lesson5_page.dart';
import 'package:ino_arduino/routes/routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icon(
                Icons.home,
                color: ArduinoTheme.brown,
              ),
              text: 'Home',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.home)),
          Divider(),
          _createDrawerItem(
              icon: Icon(
                Icons.note,
                color: ArduinoTheme.yellow,
              ),
              text: Lesson1Page.title,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.lesson1)),
          _createDrawerItem(
              icon: Icon(
                Icons.note,
                color: ArduinoTheme.yellow,
              ),
              text: Lesson2Page.title,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.lesson2)),
          _createDrawerItem(
              icon: Icon(
                Icons.note,
                color: ArduinoTheme.yellow,
              ),
              text: Lesson3Page.title,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.lesson3)),
          _createDrawerItem(
              icon: Icon(
                Icons.note,
                color: ArduinoTheme.yellow,
              ),
              text: Lesson4Page.title,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.lesson4)),
          _createDrawerItem(
              icon: Icon(
                Icons.note,
                color: ArduinoTheme.yellow,
              ),
              text: Lesson5Page.title,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.lesson5)),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
            color: ArduinoTheme.teal,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/Arduino_Logo.png'))),
        child: Stack(children: const <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("InoArduino Lesson Plan",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {required Icon icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          icon,
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
