import 'package:flutter/material.dart';

Widget LabeledImage({required String img, required String label}){
  return Column(children: [Image.asset(img),Text(label)]);
}