import 'package:flutter/material.dart';

import 'basic_component.dart';

class ComponentsGridView extends StatelessWidget {
  List<BasicComponent> components;
  ComponentsGridView(this.components);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 25,
      crossAxisSpacing: 25,
      children: components,
    );
  }
}

class Components {
  static BasicComponent arduino = BasicComponent("Arduino.png", "Arduino UNO");
  static BasicComponent breadboard =
      BasicComponent("Breadboard.png", "Breadboard");
  static BasicComponent led = BasicComponent("LED.png", "LED");
  static BasicComponent resistor = BasicComponent("Resistor.png", "Resistor");
  static BasicComponent photoresistor =
      BasicComponent("Photoresistor.png", "Photoresistor");
  static BasicComponent button = BasicComponent("Button.png", "Button");
  static BasicComponent wires = BasicComponent("Wire.png", "Wires");
}
