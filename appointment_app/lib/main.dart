import 'package:appointment_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(OnlineDentalClinic());
}

class OnlineDentalClinic extends StatelessWidget {
  const OnlineDentalClinic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Online Dental Clinic",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryIconTheme: IconThemeData(color: Colors.black),
      ),
      home: HomeScreen(title: "Online Dental Clinic"),
      debugShowCheckedModeBanner: false,
    );
  }
}
