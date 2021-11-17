import 'dart:convert';

import 'package:appointment_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:appointment_app/untilities/constants.dart';
import 'package:appointment_app/widgets/roundedBoxDecoration.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.isUser}) : super(key: key);

  final isUser;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Container hero() {
      return Container(
        height: size.height * 0.4,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Нэвтрэх",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: size.height * 0.02),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                "Нэвтрэх нэр нууц үгээ оруулна уу",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
    }

    Container body() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        alignment: Alignment.bottomCenter,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(children: [
                Container(
                  decoration: roundedBoxDecoration(Colors.white),
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _userNameController,
                    scrollPadding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Нэвтрэх нэр",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: roundedBoxDecoration(Colors.white),
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Нууц үг",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 40),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: TextButton(
                  child: Text(
                    "Нэвтрэх",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: login,
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              hero(),
              body(),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    String username = _userNameController.text;
    String password = _passwordController.text;

    print(username + " " + password + " ");

    var res = await http.post(
      Uri.parse("$baseUrl$employeeUrl$loginUrl"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {'username': username, 'password': password},
      ),
    );

    print(res.statusCode);
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        print(res.body.toString());
        widget.isUser();
      } else {
        print("User not found");
      }
    } else {
      throw Exception("Errrrrooor???");
    }
  }
}
