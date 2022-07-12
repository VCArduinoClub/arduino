import 'package:flutter/material.dart';

Widget Header1Text({required String text}) {
  return Text(text,
      style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500));
}

Widget Header2Text({required String text}) {
  return Text(text,
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400));
}

Widget Header3Text({required String text}) {
  return Text(text,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400));
}

Widget Header4Text({required String text}) {
  return Text(text,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300));
}

Widget ContentText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 14.0,
      height: 2,
    ),
  );
}

class Note extends StatelessWidget {
  const Note({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(style: DefaultTextStyle.of(context).style, children: [
      TextSpan(text: 'Note: ', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: text),
    ]));
  }
}
