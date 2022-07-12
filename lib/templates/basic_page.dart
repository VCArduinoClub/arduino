import 'package:flutter/material.dart';
import 'package:ino_arduino/widgets/drawer.dart';

import '../presets.dart';

class BasicPage extends StatefulWidget {
  const BasicPage(
      {Key? key,
      required this.title,
      required this.nextPageRoute,
      required this.content})
      : super(key: key);

  final String title;
  final String nextPageRoute;
  final List<Widget> content;

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ArduinoTheme.teal,
        title: Text(widget.title),
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView(children: widget.content))),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushReplacementNamed(context, widget.nextPageRoute),
        backgroundColor: ArduinoTheme.lightTeal,
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
