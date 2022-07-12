import 'package:flutter/material.dart';
import 'package:ino_arduino/routes/routes.dart';
import 'package:ino_arduino/templates/basic_page.dart';
import 'package:ino_arduino/widgets/sections.dart';
import 'package:ino_arduino/widgets/special_text.dart';

class Lesson2Page extends StatelessWidget {
  static const String routeName = '/lesson2';
  static const String title = 'Lesson 2 - LED';

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: title,
      nextPageRoute: Routes.lesson3,
      content: [
        Section(
          title: "Lesson",
          content: [
            MiniSection(title: "Circuits", content: [
              ContentText(
                  "You’ve probably heard of the term circuit before–– and know that it pertains to electricity in the general sense. "
                  "Circuits are the way we harness electricity and divert it into components like resistors, capacitors, and even an Arduino. "
                  "A circuit is basically a closed loop in which electricity can move. "
                  "The movement of electricity happens when billions of electrons inside billions of atoms within a circuit/material move. "
                  "Think of it like a race car track(another type of circuit!): electrons/cars move in a predetermined track. "
                  "As each car pushes forward, it creates space for the next car to move. "
                  "Another analogy is a water pipe: a circuit is a closed pipe, with the water inside it representing the electrons."),
              ContentText(
                  'Here’s some common terminology used when discussing circuits that’ll be explained with the water analogy.'),
              ContentText('Polarity/VCC/GND'),
              ContentText(
                  'Think of VCC as the starting point for our water/electricity flow. This is where the water originates from, denoted with a “+”.'),
              ContentText(
                  'Of course, this water/electricity has to go somewhere: GND. The termination point of this electricity, where it goes, is denoted as a “-”.'),
              ContentText(
                  'When we refer to polarity, we basically mean the orientation of VCC/+ and GND/-. So when we reverse polarity, the direction our water/electricity travels changes.'),
              ContentText('Charge'),
              ContentText(
                  'Charge is essentially the amount of water inherent in a circuit. This property is intrinsic to the amount of electrons in the wire/conductor the circuit is made of.'),
              ContentText('Current'),
              ContentText(
                  'Current is the amount of water/electrons flowing through a circuit at a given point when water/electricity is running.'),
              ContentText('Voltage'),
              ContentText(
                  'Voltage is the pressure/speed that water/electricity is moving at a point in the circuit.'),
              ContentText(
                  'Now, how do we go around adding to or creating our circuit?'),
              ContentText(
                  'A circuit has to have a source of water/electricity. This can be a power supply or battery added to the circuit. This battery’s VCC and GND, or polarity will define the orientation other polar components will follow.'),
              ContentText(
                  'To add other components to our circuit, we need to create a conductive connection between the component and the rest of the circuit. We want to match polarities, so a positive terminal(cathode) will be attached to the positive terminal sourced from the battery/power source/VCC, and the terminating end will be attached to the other point in the circuit.'),
              ContentText(''),
              MiniSection(title: 'What is LED? ', content: [
                ContentText(
                    'LED is a semiconductor device that emits light when current passes through it. It is polar, which means it has a single direction through which current flows. '),
                ContentText(''),
              ])
            ]),
            Section(title: 'Hands On:', content: [
              ContentText(
                  'Note: you don’t need to type the /* *Blink */ lines or the //’s because these are just comments to help you. '),
              Image.asset(Routes.imagePrefix + "BlinkCode.PNG"),
              Image.asset(Routes.imagePrefix + "LEDCircuit.PNG"),
              ContentText(
                  "Next, we will use a button to turn the light on and off. Try and build the circuit below. "
                  "Notice how the board has two circuits: you can trace both from a power source to the ground pin and rail "),
              ContentText(
                  "NOTE: 10K Ohm resistor is the one in the button circuit (right side), and the 220 Ohm resistor is the one in the light’s circuit (left side)"),
              Image.asset(Routes.imagePrefix + "LEDButtonCircuit.PNG"),
              Image.asset(Routes.imagePrefix + "LEDButtonCode.PNG"),
            ]),
          ],
        ),
      ],
    );
  }
}
