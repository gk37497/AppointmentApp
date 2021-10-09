import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/untilities/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future addOrderToDb(Order newOrder, BuildContext context) async {
  Dio dio = new Dio();
  print(newOrder.toJson());

  var response =
      await dio.post("$baseUrl$addOrderUrl", data: newOrder.toJson());

  if (response.statusCode == 200) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Success"),
          content: Text(response.statusMessage.toString()),
        );
      },
    );
  } else {
    throw throw Exception("Error");
  }
}
