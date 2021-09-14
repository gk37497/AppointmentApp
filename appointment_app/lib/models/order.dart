import 'dart:convert';

class Order {
  final String dId;
  final String aId;
  final String consumerName;
  final DateTime startDate;
  final DateTime endDate;
  final String type;
  final bool isDone;

  Order({
    required this.dId,
    required this.aId,
    required this.consumerName,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'dId': dId,
      'aId': aId,
      'consumerName': consumerName,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'type': type,
      'isDone': isDone,
    };
  }

  factory Order.fromMap(Map<String, dynamic> json) {
    return Order(
      dId: json['dId'],
      aId: json['aId'],
      consumerName: json['consumerName'],
      startDate: DateTime.fromMillisecondsSinceEpoch(json['startDate']),
      endDate: DateTime.fromMillisecondsSinceEpoch(json['endDate']),
      type: json['type'],
      isDone: json['isDone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}

List<Order> ordersData = [
  Order(
    dId: "d100",
    aId: "a100",
    consumerName: "Selenge",
    startDate: new DateTime(2021, 9, 5, 10),
    endDate: new DateTime(2021, 9, 5, 12),
    isDone: false,
    type: 'Cleaning',
  ),
  Order(
    dId: "d101",
    aId: "a101",
    consumerName: "Tulga",
    startDate: new DateTime(2021, 9, 5, 13),
    endDate: new DateTime(2021, 9, 5, 15),
    isDone: false,
    type: 'Cleaning',
  ),
  Order(
    dId: "d101",
    aId: "a102",
    consumerName: "Ganaa",
    startDate: new DateTime(2021, 9, 14, 10),
    endDate: new DateTime(2021, 9, 14, 12),
    isDone: true,
    type: 'Cleaning',
  ),
  Order(
    dId: "d103",
    aId: "a103",
    consumerName: "Boldoo",
    startDate: new DateTime(2021, 11, 14, 10),
    endDate: new DateTime(2021, 11, 14, 12),
    isDone: false,
    type: 'Cleaning',
  ),
  Order(
    dId: "d102",
    aId: "a105",
    consumerName: "Saran",
    startDate: new DateTime(2021, 10, 12, 10),
    endDate: new DateTime(2021, 10, 12, 12),
    isDone: true,
    type: 'Cleaning',
  ),
  Order(
    dId: "d100",
    aId: "a100",
    consumerName: "Sergelen",
    startDate: new DateTime(2021, 9, 12, 10),
    endDate: new DateTime(2021, 9, 12, 12),
    isDone: false,
    type: 'Cleaning',
  ),
  Order(
    dId: "d101",
    aId: "a101",
    consumerName: "Tamika",
    startDate: new DateTime(2021, 9, 5, 13),
    endDate: new DateTime(2021, 9, 5, 15),
    isDone: false,
    type: 'Dental implant',
  ),
  Order(
    dId: "d101",
    aId: "a102",
    consumerName: "Halzka",
    startDate: new DateTime(2021, 9, 4, 10),
    endDate: new DateTime(2021, 9, 4, 12),
    isDone: true,
    type: 'Cleaning',
  ),
  Order(
    dId: "d103",
    aId: "a103",
    consumerName: "Vovka",
    startDate: new DateTime(2021, 9, 5, 10),
    endDate: new DateTime(2021, 9, 5, 12),
    isDone: false,
    type: 'Cleaning',
  ),
  Order(
    dId: "d102",
    aId: "a104",
    consumerName: "Seree",
    startDate: new DateTime(2021, 10, 6, 10),
    endDate: new DateTime(2021, 10, 6, 12),
    isDone: true,
    type: 'Cleaning',
  ),
  Order(
    dId: "d102",
    aId: "a111",
    consumerName: "Halbaga",
    startDate: new DateTime(2021, 9, 3, 10),
    endDate: new DateTime(2021, 9, 3, 12),
    isDone: false,
    type: 'Cleaning',
  ),
  Order(
    dId: "d102",
    aId: "a112",
    consumerName: "Ayga",
    startDate: new DateTime(2021, 9, 3, 10),
    endDate: new DateTime(2021, 9, 3, 12),
    isDone: false,
    type: 'Cleaning',
  ),
];
