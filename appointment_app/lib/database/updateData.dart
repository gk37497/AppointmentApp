import 'package:appointment_app/models/order.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future updateOrderToDb(Order currentOrder, BuildContext context) async {
  Dio _dio = new Dio();
  int orderId = currentOrder.oId;
  var response = await _dio.put("http://localhost:8080/updateOrder/$orderId",
      data: currentOrder.toJson());

  if (response.statusCode == 200) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Update Success"),
          content: Text(response.statusMessage.toString()),
        );
      },
    );
  } else {
    throw throw Exception("Error");
  }
}
