import 'package:flutter/material.dart';

class Utils{
  static Color getColorFromCriteria(String color) {
    switch (color) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      default:
        return Colors.white;
    }
  }
}