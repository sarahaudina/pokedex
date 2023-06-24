import 'package:flutter/material.dart';

String capitalize(String initial) {
  return "${initial[0].toUpperCase()}${initial.substring(1).toLowerCase()}";
}

Color getContrastColor(Color mainColor) {
  if (mainColor==Colors.white) {
    return Colors.black;
  } else {
    return Colors.white;
  }
}

Color getColor(String color) {
  Map<String, Color> colorMap = {
    "brown": Colors.brown,
    "purple": Colors.purple,
    "yellow": Colors.yellow,
    "green": Colors.green,
    "blue": Colors.blue,
    "red": Colors.red,
    "white": Colors.white,
    "gray": Colors.grey,
    "pink": Colors.pink,
    "black": Colors.black
  };

  return colorMap[color] ?? Colors.pink;
}