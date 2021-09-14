import 'package:appointment_app/widgets/roundedBoxDecoration.dart';
import 'package:flutter/material.dart';

Container roundedButton(
  String text,
  Color color,
  Color textColor,
  Size size,
  onClicked,
) {
  return Container(
    height: size.height * 0.06,
    width: size.width * 0.5 - 25,
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
