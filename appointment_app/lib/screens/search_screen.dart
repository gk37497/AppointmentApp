import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/providers/orderProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppointmentSearch extends SearchDelegate<Order> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        // close(
        //   context,
        //   Order(
        //       dentist_id: 0,
        //       orderId: 11,
        //       consumerName: "",
        //       startDate: DateTime.now(),
        //       endDate: DateTime.now(),
        //       isDone: 0,
        //       tId: 23),
        // );
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final orderMdl = Provider.of<OrderProvider>(context);
    final List<Order> data = orderMdl.ordersData;
    Size size = MediaQuery.of(context).size;

    final List<Order> suggestionsList = query.isEmpty
        ? []
        : data
            .where((element) => element.consumerName.startsWith(query))
            .toList();

    return searchBody(size, suggestionsList);
  }
}

Container searchBody(Size size, List<Order> data) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    height: size.height * 0.68,
    child: ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        return Card(
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.radio_button_unchecked),
              onPressed: () {},
            ),
            title: Row(
              children: [
                Text(data[i].consumerName,
                    style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(width: 10),
                Text("Dentist: Khulan")
              ],
            ),
            subtitle: Text(
              DateFormat('HH.mm').format(data[i].startDate) +
                  "-" +
                  DateFormat('HH.mm').format(data[i].endDate) +
                  " (" +
                  data[i].orderType.tId.toString() +
                  ")",
            ),
            dense: true,
            trailing: Icon(Icons.edit),
          ),
        );
      },
    ),
  );
}
