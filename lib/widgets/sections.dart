import 'package:flutter/material.dart';
import 'package:ino_arduino/widgets/special_text.dart';

Widget Section({required String title, required List<Widget> content}) {
  content.insert(0, Center(child: Header2Text(text: title)));
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: content,
  );
}

Widget MiniSection({required String title, required List<Widget> content}) {
  content.insert(0, Center(child: Header4Text(text: title)));
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: content,
  );
}
