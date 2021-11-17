import 'package:appointment_app/database/addData.dart';
import 'package:appointment_app/database/getDataFrom.dart';
import 'package:appointment_app/models/type.dart';
import 'package:flutter/material.dart';

class TypesProvider with ChangeNotifier {
  List<OrderType> orderTypesData = [];
  bool loading = false;

  getTypesData() async {
    loading = true;
    orderTypesData = await getTypesFromDb();
    loading = false;
    notifyListeners();
  }

  addOrderType(OrderType newOrderType, BuildContext context) async {
    await addTypeToDb(newOrderType, context);
    orderTypesData.add(newOrderType);
    notifyListeners();
  }
}
