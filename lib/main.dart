import 'package:flutter/material.dart';
import 'package:ino_arduino/routes/lesson1_page.dart';
import 'package:ino_arduino/routes/home_page.dart';
import 'package:ino_arduino/routes/lesson2_page.dart';
import 'package:ino_arduino/routes/lesson3_page.dart';
import 'package:ino_arduino/routes/lesson4_page.dart';
import 'package:ino_arduino/routes/lesson5_page.dart';
import 'package:ino_arduino/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InoArduino',
      home: HomePage(),
      routes: {
        Routes.home: (context) => HomePage(),
        Routes.lesson1: (context) => Lesson1Page(),
        Routes.lesson2: (context) => Lesson2Page(),
        Routes.lesson3: (context) => Lesson3Page(),
        Routes.lesson4: (context) => Lesson4Page(),
        Routes.lesson5: (context) => Lesson5Page(),
      }
    );
  }
}

