import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/untilities/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future deleteOrderFromDb(Order order, BuildContext context) async {
  Dio _dio = new Dio();
  int orderId = order.oId;
  var response = await _dio.delete("$baseUrl$deleteOrderUrl/$orderId");

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
