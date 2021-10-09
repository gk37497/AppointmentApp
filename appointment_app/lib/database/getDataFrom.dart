import 'dart:convert';
import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/untilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:appointment_app/models/dentist.dart';
import 'package:appointment_app/models/type.dart';

Future<List<Dentist>> getDentists() async {
  var response = await http.get(Uri.parse("$baseUrl$getDentistsUrl"));
  if (response.statusCode == 200) {
    List jsonData = json.decode(response.body);
    return jsonData.map((data) => new Dentist.fromMap(data)).toList();
  } else {
    throw Exception("Error");
  }
}

Future<List<OrderType>> getTypesFromDb() async {
  var data = await http.get(Uri.parse("$baseUrl$getAllTypesUrl"));
  if (data.statusCode == 200) {
    List jsonData = json.decode(data.body);
    return jsonData.map((e) => new OrderType.fromMap(e)).toList();
  } else {
    throw Exception("Error");
  }
}

Future<List<Order>> getOrders() async {
  var data = await http.get(Uri.parse("$baseUrl$getOrdersUrl"));
  if (data.statusCode == 200) {
    List jsonData = json.decode(data.body);
    return jsonData.map((e) => new Order.fromMap(e)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
