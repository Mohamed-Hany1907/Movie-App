import 'dart:ui';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextProfile extends StatelessWidget {
  String text;
  double TextSize;
  Color color;
   TextProfile({required this.text, required this.TextSize,required this.color,  super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: TextSize,
        fontWeight: FontWeight.w700
      ),
    );
  }
}
