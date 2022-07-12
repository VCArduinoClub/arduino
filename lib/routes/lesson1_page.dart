import 'package:flutter/material.dart';
import 'package:ino_arduino/routes/routes.dart';
import 'package:ino_arduino/templates/basic_page.dart';
import 'package:ino_arduino/widgets/sections.dart';
import 'package:ino_arduino/widgets/special_text.dart';

class Lesson1Page extends StatelessWidget {
  static const String routeName = '/lesson1';
  static const String title = 'Lesson 1 - Basics';

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: title,
      nextPageRoute: Routes.lesson2,
      content: [
        Section(
          title: "Lesson",
          content: [
            MiniSection(title: "The Arduino", content: [
              ContentText("So, what really IS the arduino? "
                  "The arduino is a tiny computer that takes instructions from your computer and sends them to devices you connect to the Arduino. "
                  "You can connect many types of devices to an arduino, including LEDs, sensors, and input devices such as buttons. "
                  "You can even attach an LED screen to display things!"),
            ]),
            MiniSection(title: "Pins and components", content: [
              ContentText(
                  "There are many different Arduino boards, but we are focused on the Arduino Uno, the board in your kit. "),
              Image.asset(Routes.imagePrefix + "ArduinoPins.JPG"),
              ContentText(
                  "The analog pins are for analog input, which ranges from 0-5 V. This is different from the digital pins, on the right side of the board in the schematic above, which only have a HIGH and LOW signal (0 OR 5 V). "),
              Image.asset(Routes.imagePrefix + "AnalogDigitalExplain.PNG"),
              ContentText(
                  "PWM pins are a special type of digital pin. They are essentially a digital pin that can simulate an analog output — in other words, an output between 0 and 5 V. They do this through a PWM wave, which has a certain cycle that averages to a certain voltage. "),
              Text(
                  "The arduino also has power pins. A 5V pin provides power and a GND pin provides a reference voltage for that power source. "),
            ]),
            MiniSection(title: "How to load and setup IDE", content: [
              ContentText("https://www.youtube.com/watch?v=4vgB974BBH8"),
            ]),
            MiniSection(title: "What is code?", content: [
              ContentText(
                  "Code is a set of instructions you give to a computer in order to accomplish a task. In our case, the computer is the arduino. For Arduino, you will naturally pick up the C++ language along the way because a lot of the language is explained through the Arduino functionality and how the code is written."),
            ]),
            MiniSection(title: "What is a breadboard?", content: [
              ContentText(
                  "Breadboards allow to easily connect components on a circuit. Both the ground and power rails are electrically connected horizontally down the breadboard as seen by the red and blue lines. This means that anything connected to a power rail (ie. 5V) can be shared by anything on that rail. The circuit rails are electrically connected vertically."),
              Image.asset(Routes.imagePrefix + "BreadboardExplain.PNG"),
            ])
          ],
        ),
        Section(title: "Hands On: ", content: [
          ContentText(
              "Make sure you connect your Arduino to your computer using the USB-B cable, which is typically blue. Be sure to select the board in the IDE as the Arduino UNO."),
          Note(
              text:
                  "To select the board, go to tools->board->arduino AVR boards, and find the Arduino UNO"),
          ContentText(
              "This is a hello world code for Arduino. The setup code runs once. Try running this code on your IDE, and uploading to the Arduino! Typing it out might seem tedious, but it's the best way you will learn the language and structure."),
          Image.asset(Routes.imagePrefix + "HelloWorldCode.PNG"),
          ContentText(
              "How do you run the code? Just click the right arrow button on the top left!"),
        ]),
        Section(title: "Code Lesson: ", content: [
          ContentText(
              "Here, we will cover a few main topics you will need to be familiar with to code the arduino. "
              "We covered what code was in the previous section: basically a set of instructions for a computer. Now, we will cover some key coding concepts and things you should know specifically for the Arduino! "
              "What are variables in programming? They are pretty much the same thing as variables in your algebra class, except variables need a type. A type is what kind of data that variable stores. For the arduino, a variable is declared as the following: "),
          ContentText("[type] [variable name] = [some value];"),
          ContentText("ex: int x = 4;"),
          ContentText(
              "Notice that x is the name, 4 is the value. What is the type? The variable is an int, short for integer. So, it stores an integer value: 4."),
          ContentText("Here are some other data types:"),
          ContentText("bool - holds a true or false value"),
          ContentText("EX: bool example = true;"),
          ContentText("double - holds a decimal value"),
          ContentText("EX: double example = 1.0042;"),
          ContentText("string - holds a set of characters"),
          ContentText("EX: string hello = “Hi from the Arduino”;"),
          ContentText(
              "Note: every line ends in a semicolon; This is a part of the syntax of the language, or the rules that allow us to correctly format our program; Think of it like how we need proper grammar to form valid sentences!"),
          ContentText(
              "What is a function? A function is code that is clumped together and outputs a value and denoted by a function name. Often, they need input to perform operations on. Here are some of the functions you will need to know:"),
          ContentText("digitalRead(pin)"),
          ContentText(
              "Reads the value from a specified digital pin, either HIGH or LOW."),
          ContentText("val = digitalRead(7);"),
          ContentText('digitalWrite(pin, value)'),
          ContentText('Write a HIGH or a LOW value to a digital pin.'),
          ContentText('digitalWrite(2, HIGH);  - sets pin 2 to a 5 V voltage '),
          ContentText('pinMode(pin, mode) - mode can be INPUT or OUTPUT'),
          ContentText(
              'If the pin has been configured as an OUTPUT with pinMode(), the pin will be able to output a positive voltage (5V). '),
          ContentText(
              'If the pin has been configured as an INPUT with pinMode(), the pin will be able to accept a positive voltage'),
          ContentText('pinMode(13, OUTPUT); // sets pin #13 to output'),
          ContentText('analogRead(pin)'),
          ContentText('Reads the value from the specified analog pin.'),
          ContentText(
              'If the analog input pin is not connected to anything, the value returned will fluctuate based on a number of factors (e.g. the values of the other analog inputs, how close your hand is to the board, etc.)'),
          ContentText('analogWrite(pin, value)'),
          ContentText('Writes an analog value (PWM wave) to a pin'),
          ContentText(
              'After a call to analogWrite(), the pin will generate a steady rectangular wave of the specified duty cycle until the next call to analogWrite() (or a call to digitalRead() or digitalWrite()) on the same pin.'),
          ContentText(
              'Value is the duty cycle between 0 (always off) and 255 (always on) (int only)'),
          ContentText('pulseIn(pin, value, timeout)'),
          ContentText('Reads a pulse on a pin'),
          ContentText(
              'Returns the length of the pulse in microseconds or gives up and returns 0 if no complete pulse was received within the timeout'),
          ContentText('tone(pin, frequency, duration)'),
          ContentText(
              'Generates a square wave of the specified frequency (and 50% duty cycle) on a pin'),
          ContentText('Can be connected to a buzzer '),
          ContentText('noTone(pin)'),
          ContentText(
              'Stops the generation of a square wave triggered by tone(). Has no effect if no tone is being generated'),
          ContentText('delay(x)'),
          ContentText('Pauses program for x amount of time (in milliseconds)'),
          ContentText(''),
          ContentText(
              'The arduino has two functions in a program, which you will see in your arduino IDE.'),
          ContentText('setup(), and loop(). '),
          ContentText(''),
          ContentText(
              'The setup() function will run first on the arduino, and this is the function in which you change pin modes or do things that only need to be done ONCE.'),
          ContentText(''),
          ContentText(
              'The loop() function is where you write code that needs to be run continuously after the setup() function runs. This is where you read pin values, or in general do things that require reading/writing data. '),
          ContentText(''),
          ContentText(
              'We strongly encourage INOArduino users to refer to the following link for a more comprehensive overview of arduino programming: '),
          ContentText(''),
          ContentText('https://www.arduino.cc/reference/en/'),
          ContentText(''),
        ])
      ],
    );
  }
}
