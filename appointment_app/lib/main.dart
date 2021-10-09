import 'package:appointment_app/providers/orderProvider.dart';
import 'package:appointment_app/providers/typeProvider.dart';
import 'package:appointment_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/dentistProvider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DentistProvider()),
      ChangeNotifierProvider(create: (context) => OrderProvider()),
      ChangeNotifierProvider(create: (context) => TypesProvider()),
    ],
    child: OnlineDentalClinic(),
  ));
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
