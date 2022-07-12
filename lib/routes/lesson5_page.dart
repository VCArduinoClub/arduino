import 'package:flutter/material.dart';
import 'package:ino_arduino/routes/routes.dart';
import 'package:ino_arduino/templates/basic_page.dart';
import 'package:ino_arduino/widgets/sections.dart';
import 'package:ino_arduino/widgets/special_text.dart';

class Lesson5Page extends StatelessWidget {
  static const String routeName = '/lesson5';
  static const String title = 'Lesson 5 - Challenge Project';

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: title,
      nextPageRoute: Routes.home,
      content: [
        Section(
          title: "About",
          content: [
            ContentText(
                "Rotate servo proportionally to the distance of your hand from the ultrasonic sensor")
          ],
        ),
        Section(title: "Lesson", content: [
          MiniSection(title: "PWM", content: [
            ContentText(
                "PWM is how a digital pin can simulate analog output: this can be useful for setting an LED to something in the middle of off and full brightness."),
            Image.asset(Routes.imagePrefix + "PWMExplain.PNG"),
            ContentText(
                "We can use PWM to do several things, but in this project we’ll use it to control a servo proportional to an ultrasonic sensor’s readings."),
            ContentText(
                "This is a CHALLENGE project, so you’ll be doing a majority of the coding and wiring for this project! We’ll give you a couple of hints and tips, but ultimately, executing the project is all up to you and your comprehension of the previous lessons."),
            ContentText(
                "So what is the task? We want you to design code that rotates a servo proportionally to the distance your hand is from an ultrasonic sensor. Refer to the code in the previous lesson for the ultrasonic sensor."),
            ContentText(
                "We want you to do some of your own research on the Servo library that arduino provides, which is basically code that is already made which you can use to control a servo motor."),
            ContentText(
                "Servo library reference: https://www.arduino.cc/reference/en/libraries/servo/"),
            ContentText(
                "Hint, you will need to use the map() function to convert the distance from the sensor to a rotational input to the servo, refer to this below: https://www.arduino.cc/reference/en/language/functions/math/map/"),
          ]),
          Section(title: "Solution Code", content: [
            Image.asset(Routes.imagePrefix + "ChallengePart1.jpg"),
            Image.asset(Routes.imagePrefix + "ChallengePart2.jpg"),
          ]),
        ]),
      ],
    );
  }
}
