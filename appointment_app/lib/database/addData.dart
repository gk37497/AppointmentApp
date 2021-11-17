import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/models/type.dart';
import 'package:appointment_app/untilities/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future addOrderToDb(Order newOrder, BuildContext context) async {
  Dio dio = new Dio();
  String url = "$baseUrl$orderUrl";

  var response = await dio.post("$url$addUrl", data: newOrder.toJson());

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

Future addTypeToDb(OrderType newType, BuildContext context) async {
  Dio dio = new Dio();
  String url = "$baseUrl$orderTypeUrl";

  var response = await dio.post("$url$addUrl", data: newType.toJson());

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
