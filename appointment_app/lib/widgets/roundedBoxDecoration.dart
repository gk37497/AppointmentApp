import 'package:flutter/material.dart';

BoxDecoration roundedBoxDecoration(Color borderColor) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    border: Border.all(width: 1, color: borderColor),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(143, 148, 251, .2),
        blurRadius: 20.0,
        offset: Offset(0, 5),
      ),
    ],
  );
}
