import 'package:flutter/material.dart';
import 'package:ino_arduino/routes/routes.dart';
import 'package:ino_arduino/templates/basic_page.dart';

class TestPage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: "InoArduino",
      nextPageRoute: Routes.home,
      content: [],
    );
  }
}
