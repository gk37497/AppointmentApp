import 'package:flutter/material.dart';

Container noOrder(Size size, bool upComingBtnClicked) {
  return Container(
    height: size.height * 0.67,
    child: Center(
      child: Text(
        upComingBtnClicked ? "No upComing orders." : "No completed orders.",
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 20,
        ),
      ),
    ),
  );
}
