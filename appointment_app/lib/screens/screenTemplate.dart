import 'package:flutter/material.dart';

Scaffold pageTemplate(List<Widget> children) {
  return Scaffold(
    body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        )),
  );
}
