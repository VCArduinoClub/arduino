import 'package:flutter/material.dart';
import 'package:ino_arduino/routes/routes.dart';

class BasicComponent extends StatelessWidget {
  String img;
  String label;
  BasicComponent(this.img, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(Routes.imagePrefix + img, fit: BoxFit.contain),
        ),
        Text(label)
      ],
    );
  }
}
