import 'dart:convert';

import 'package:appointment_app/database/addData.dart';
import 'package:appointment_app/database/deleteData.dart';
import 'package:appointment_app/database/getDataFrom.dart';
import 'package:appointment_app/database/updateData.dart';
import 'package:appointment_app/models/order.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  List<Order> ordersData = [];

  bool loading = false;

  getOrdersData() async {
    loading = true;
    ordersData = await getOrders();
    print(ordersData[0].consumerName);
    loading = false;
    notifyListeners();
  }

  addOrder(Order newOrder, BuildContext context) async {
    await addOrderToDb(newOrder, context);
    ordersData.add(newOrder);
    notifyListeners();
  }

  deleteOrder(Order order, BuildContext context) async {
    print("Start");
    await deleteOrderFromDb(order, context);
    print("end");
    ordersData.remove(order);
    notifyListeners();
  }

  updateOrder(Order order, BuildContext context) async {
    await updateOrderToDb(order, context);
    ordersData.removeWhere((element) => element.orderId == order.orderId);
    ordersData.add(order);
    notifyListeners();
  }
}
