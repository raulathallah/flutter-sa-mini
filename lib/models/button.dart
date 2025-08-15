import 'package:flutter/material.dart';

class AppButtonStyles {
  static final ButtonStyle primary = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    backgroundColor: Colors.blue[50],
    foregroundColor: Colors.blue,
    textStyle: TextStyle(fontSize: 12),
    elevation: 1,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  );

  static final ButtonStyle secondary = ElevatedButton.styleFrom(
    iconColor: Colors.blue,
    foregroundColor: Colors.blue,
    backgroundColor: Colors.white,
    textStyle: TextStyle(fontSize: 12),
    elevation: 1,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}
