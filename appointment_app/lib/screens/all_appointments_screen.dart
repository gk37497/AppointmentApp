import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/providers/dentistProvider.dart';
import 'package:appointment_app/providers/orderProvider.dart';
import 'package:appointment_app/providers/typeProvider.dart';
import 'package:appointment_app/screens/screenTemplate.dart';
import 'package:appointment_app/screens/search_screen.dart';
import 'package:appointment_app/untilities/constants.dart';
import 'package:appointment_app/widgets/noOrder.dart';
import 'package:appointment_app/widgets/screenHeader.dart';
import 'package:appointment_app/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  bool _upcomingBtnClicked = true;
  bool _pastBtnClicked = false;

  @override
  Widget build(BuildContext context) {
    final orderMdl = Provider.of<OrderProvider>(context);
    final dentistMdl = Provider.of<DentistProvider>(context);
    final typesMdl = Provider.of<TypesProvider>(context);

    List<Order> _upcomingAppointments =
        orderMdl.ordersData.where((element) => element.isDone == 0).toList();
    List<Order> _pastAppointments =
        orderMdl.ordersData.where((element) => element.isDone == 1).toList();

    Size size = MediaQuery.of(context).size;
    //Page header
    Row pageHeader() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          header(
            allOrdersScreenTitle,
            _upcomingBtnClicked
                ? allOrderStr1 + " ${_upcomingAppointments.length}"
                : allOrderStr2 + " ${_pastAppointments.length}",
          ),
          IconButton(
              onPressed: () async {
                final c = await showSearch(
                  context: context,
                  delegate: AppointmentSearch(),
                );
                print(c!.startDate);
              },
              icon: Icon(Icons.search)),
        ],
      );
    }

    Container pageBody(Size size, List<Order> data) {
      return data.length > 0
          ? (Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 0, vertical: size.width * 0.04),
              height: size.height * 0.68,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      // leading: IconButton(
                      //   icon: Icon(Icons.radio_button_unchecked),
                      //   onPressed: () {},
                      // ),
                      title: Row(
                        children: [
                          Text(data[i].consumerName,
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          SizedBox(width: 10),
                          Text(dentistMdl.dentistsData
                              .firstWhere((e) => e.dId == data[i].dId)
                              .firstName),
                        ],
                      ),
                      subtitle: Text(
                        dateConvert(data[i].startDate) +
                            "-" +
                            dateConvert(data[i].endDate) +
                            " (" +
                            typesMdl.orderTypesData
                                .firstWhere((e) => e.tId == data[i].tId)
                                .typeName +
                            ")",
                      ),
                      dense: true,
                      trailing: IconButton(
                        onPressed: () {
                          deleteBtnHandler(
                            data[i],
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ))
          : noOrder(size, _upcomingBtnClicked);
    }

    Row buttonBar(Size size) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          roundedButton(
            allOrderStr1,
            _upcomingBtnClicked ? Colors.blue : Colors.white,
            _upcomingBtnClicked ? Colors.white : Colors.blue,
            size,
            upcomingBtnHandler,
          ),
          roundedButton(
            allOrderStr2,
            _pastBtnClicked ? Colors.blue : Colors.white,
            _pastBtnClicked ? Colors.white : Colors.blue,
            size,
            pastBtnHandler,
          ),
        ],
      );
    }

    return pageTemplate([
      Container(
        child: pageHeader(),
        height: size.height * 0.14,
      ),
      buttonBar(size),
      !orderMdl.loading
          ? pageBody(
              size,
              _upcomingBtnClicked ? _upcomingAppointments : _pastAppointments,
            )
          : Container(child: Center(child: CircularProgressIndicator())),
    ]);
  }

  void upcomingBtnHandler() {
    setState(() {
      _upcomingBtnClicked = true;
      _pastBtnClicked = false;
    });
  }

  void pastBtnHandler() {
    setState(() {
      _upcomingBtnClicked = false;
      _pastBtnClicked = true;
    });
  }

  void deleteBtnHandler(Order order) {
    final orderMdl = Provider.of<OrderProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Захиалга устгах"),
          content: Text(deleteAlertQs),
          actions: [
            TextButton(
              onPressed: () {
                orderMdl.deleteOrder(order, context);
                Navigator.pop(context);
              },
              child: Text("Тийм"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Үгүй",
                  style: TextStyle(color: Colors.red),
                )),
          ],
        );
      },
    );
  }

  String dateConvert(DateTime date) {
    return DateFormat('HH.mm').format(date);
  }
}
