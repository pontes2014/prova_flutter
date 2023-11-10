import 'package:flutter/material.dart';

class CustomDecorations {
  static BoxDecoration gradientBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.lightBlueAccent, Colors.green],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}