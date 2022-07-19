import 'package:flutter/material.dart';
import 'package:ino_arduino/materials/components_gridview.dart';
import 'package:ino_arduino/routes/routes.dart';
import 'package:ino_arduino/templates/basic_page.dart';
import 'package:ino_arduino/widgets/special_text.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: "InoArduino",
      nextPageRoute: Routes.lesson1,
      content: [
        Center(
          child: Header2Text(text: "Hello!"),
        ),
        Text("Welcome to the INOArduino App! "
            "In this guide, we will teach you ALL the basics of the Arduino. "
            "The kit comes with everything you need to follow along with this guide and learn how to use an Arduino. "
            "If you want to follow along without buying the kit, here are the Arduino kit components: "),
        ComponentsGridView([
          Components.arduino,
          Components.breadboard,
          Components.led,
          Components.resistor,
          Components.button,
          Components.photoresistor,
          Components.wires
        ]),
        Text(
            "You will learn all about the Arduino UNO, the breadboard, LED, resistor, button, sensors, wires, circuitry, and more! "
            "In order to use the Arduino you will need a working computer and a USB port that can connect your computer to the Arduino. ")
      ],
    );
  }
}
