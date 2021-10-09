import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/providers/orderProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Order> getOrderData(int dId, BuildContext context) {
  final orderMdl = Provider.of<OrderProvider>(context);
  return orderMdl.ordersData.where((element) => element.dId == dId).toList();
}
