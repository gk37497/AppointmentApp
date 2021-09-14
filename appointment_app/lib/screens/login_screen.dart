import 'package:appointment_app/widgets/roundedBoxDecoration.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginPageHero(size: size),
              LoginPageBody(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPageHero extends StatelessWidget {
  const LoginPageHero({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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
}

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Column(children: [
            Container(
              decoration: roundedBoxDecoration(Colors.white),
              padding: EdgeInsets.all(8.0),
              child: TextField(
                scrollPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Нэвтрэх нэр",
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: roundedBoxDecoration(Colors.white),
              padding: EdgeInsets.all(8.0),
              child: TextField(
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
              onPressed: () {
                Navigator.pushNamed(context, '/today');
              },
            ),
          )
        ],
      ),
    );
  }
}
