import 'package:flutter/material.dart';

Padding header(String title, String subtitle) {
  return (Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        Text(
          subtitle,
          style:
              TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w300),
        ),
      ],
    ),
  ));
}
