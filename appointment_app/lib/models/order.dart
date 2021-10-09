import 'dart:convert';

class Order {
  int oId;
  int dId;
  int tId;
  String consumerName;
  DateTime startDate;
  DateTime endDate;
  int isDone;

  Order({
    required this.dId,
    required this.oId,
    required this.tId,
    required this.consumerName,
    required this.startDate,
    required this.endDate,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'oId': oId,
      'dId': dId,
      'tId': tId,
      'consumerName': consumerName,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'isDone': isDone,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      oId: map['oId'],
      dId: map['dId'],
      tId: map['tId'],
      consumerName: map['consumerName'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      isDone: map['isDone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
