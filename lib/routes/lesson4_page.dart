import 'package:flutter/material.dart';
import 'package:ino_arduino/routes/routes.dart';
import 'package:ino_arduino/templates/basic_page.dart';
import 'package:ino_arduino/widgets/sections.dart';
import 'package:ino_arduino/widgets/special_text.dart';

class Lesson4Page extends StatelessWidget {
  static const String routeName = '/lesson4';
  static const String title = "Lesson 4 - Sensors";

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: title,
      nextPageRoute: Routes.lesson5,
      content: [
        Section(title: "Lesson", content: [
          MiniSection(title: "Ultrasonic Sensor", content: [
            ContentText(
                "What is an ultrasonic sensor? Sensors that can detect something in their path or some obstruction. How do they work? Ultrasonic sensors work by sending out a sound wave at a frequency above the range of human hearing. The sensor can determine the distance from a target by recording the time that it takes for the sound wave to bounce back towards the sensor’s microphone. "),
          ]),
        ]),
        Section(title: "Hands On", content: [
          ContentText(
              "Ultrasonic movement detection that is modulated by LED with a PWM signal"),
          Image.asset(Routes.imagePrefix + "UltrasonicExplain.PNG"),
          ContentText("1. VCC pin is power, connecting to 5V on the Arduino"),
          ContentText(
              "2. GND pin connects to the GND pin on the Arduino board"),
          ContentText(
              "3. The Trig pin is used to trigger an ultrasonic wave, and connects to a digital pin on the board"),
          ContentText(
              "4. The Echo pin is the pin that goes high for a period of time which will be equal to the time that it takes for the wave to return to the sensor. This also connects to a digital pin on the Arduino board."),
          ContentText(
              "Check out the example code below and type it out. The code reads distance from the ultrasonic sensor and displays it:"),
          Image.asset(Routes.imagePrefix + "Lesson4UltraBasic.png"),
          ContentText(
              "Advanced activity: Check the code below. It reads a distance from the ultrasonic sensor and displays it on the monitor. Try running it."),
          ContentText(
              "Your task is to design a game in which you are to get the ultrasonic sensor reading as close to a goal distance as possible. The goal distance must be randomly picked in a reasonable range, and you can use the reading distance code below as the base of your game."),
          ContentText("Final Behavior outline:"),
          ContentText("Tells player a round is starting and the round number"),
          ContentText(
              "Generate a random distance and inform the player of the distance.  Make sure to use randomSeed() on an analog pin.  Use random() with two arguments to generate random numbers in a range"),
          ContentText("EX: randomSeed(some_analog_pin); (in setup)"),
          ContentText(
              "random(0, 50) (in loop): generates a random number in the range 0-50"),
          ContentText(
              "Provide a 3,2,1 countdown for the player to place their hand in place attempting to match the goal distance (use delay function)"),
          ContentText("Provide the result and how far off the player was"),
          ContentText(
              "Start the next round (it is a loop so this should automatically happen)"),
          ContentText("The Game (answer)"),
          Image.asset(Routes.imagePrefix + "UltrasonicPart1.jpg"),
          Image.asset(Routes.imagePrefix + "UltrasonicPart2.jpg"),
        ])
      ],
    );
  }
}

