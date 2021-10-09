import 'package:flutter/material.dart';

String baseUrl = "http://localhost:8080/";

String getDentistsUrl = "getAllDentists";
String addDentistUrl = "addDentist";

String getOrdersUrl = "getAllOrders";
String addOrderUrl = "addOrders";
String deleteOrderUrl = "deleteOrder";

String getAllTypesUrl = "getAllTypes";
String addOrderType = "addType";

String loginUrl = "login";

String todayScreenTitle = "Өнөөдрийн хуваарь";
String todayScreenStr1 = "Хүлээгдэж буй";
String todayScreenStr2 = "Биелэгдсэн";

String addOrderScreenTitle = "Цаг захиалах";

String allOrdersScreenTitle = "Бүх захиалга";
String allOrderStr1 = "Биелэгдээгүй";
String allOrderStr2 = "Биелэгдсэн";

String deleteAlertQs = "Итгэлтэй байна уу?";

class TypeDetials {
  String name;
  IconData iconName;
  Color color;

  TypeDetials({
    required this.name,
    required this.iconName,
    required this.color,
  });
}

List<TypeDetials> orderTypeDetials = [
  TypeDetials(
      name: "Dental Implant",
      iconName: Icons.snowshoeing,
      color: Colors.redAccent),
  TypeDetials(
      name: "Cleaning", iconName: Icons.ac_unit_outlined, color: Colors.blue),
  TypeDetials(
      name: "Tooth Pain",
      iconName: Icons.baby_changing_station,
      color: Colors.purple),
  TypeDetials(
      name: "Consultation",
      iconName: Icons.cabin_outlined,
      color: Colors.orange),
  TypeDetials(
      name: "Braces", iconName: Icons.dark_mode_outlined, color: Colors.green),
];
