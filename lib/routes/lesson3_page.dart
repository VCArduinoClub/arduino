import 'package:flutter/material.dart';
import 'package:ino_arduino/routes/routes.dart';
import 'package:ino_arduino/templates/basic_page.dart';
import 'package:ino_arduino/widgets/sections.dart';
import 'package:ino_arduino/widgets/special_text.dart';

class Lesson3Page extends StatelessWidget {
  static const String routeName = '/lesson3';
  static const String title = "Lesson 3 - External Controls";
  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: title,
      nextPageRoute: Routes.lesson4,
      content: [
        Section(title: "Lesson", content: [
          MiniSection(title: "Serial", content: [
            ContentText(
                "While it is pronounced just like the food we eat, serial has a completely different purpose. Serial is the name for how the arduino talks to the other devices. This is done through the arduino UART, which is the device that facilitates serial communication. The serial pins on the arduino uno are the RX and TX pins (0 and 1 pins). Serial is also the form of communication between the computer and the arduino, which is what allows the arduino to print text on the serial monitor."),
          ]),
          MiniSection(title: "Importance", content: [
            ContentText(
                "It allows the arduino to display text in the serial monitor, and it also allows communication between more than one microcontroller."),
            Image.asset(Routes.imagePrefix + "SerialMonitor.JPG"),
          ])
        ]),
        Section(title: "Hands On", content: [
          ContentText(
              "The IDE has a special serial monitor that you can open in the top right corner of the screen, as depicted in the image above. This can allow you to view data as it is sent from the Arduino. Try to print something to the serial monitor!"),
        ])
      ],
    );
  }
}
