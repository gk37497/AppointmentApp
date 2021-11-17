import 'dart:ffi';

import 'package:appointment_app/widgets/roundedBoxDecoration.dart';
import 'package:flutter/material.dart';

Container roundedButton(
  String text,
  Color color,
  Color textColor,
  double? size,
  onClicked,
) {
  return Container(
    height: 40,
    width: size,
    decoration: roundedBoxDecoration(Colors.blue),
    child: TextButton(
      onPressed: onClicked,
      child: Text(text),
      style: TextButton.styleFrom(
        backgroundColor: color,
        textStyle: TextStyle(fontSize: 15),
        primary: textColor,
      ),
    ),
  );
}
