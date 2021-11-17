import 'package:flutter/material.dart';

class DentistProfile extends StatelessWidget {
  const DentistProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 40,
        elevation: 0.1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _size.height * 0.15,
              width: _size.width,
              color: Colors.blue,
              child: CircleAvatar(),
            )
          ],
        ),
      ),
    );
  }
}
