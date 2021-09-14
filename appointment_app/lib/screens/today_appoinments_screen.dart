import 'package:appointment_app/models/dentist.dart';
import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/widgets/screenHeader.dart';
import 'package:flutter/material.dart';
import 'package:appointment_app/widgets/roundedButton.dart';
import 'package:intl/intl.dart';

import 'edit_appointment_screen.dart';

class TodayAppointments extends StatefulWidget {
  const TodayAppointments({Key? key}) : super(key: key);

  @override
  _TodayAppointmentsState createState() => _TodayAppointmentsState();
}

class _TodayAppointmentsState extends State<TodayAppointments> {
  bool _pendingBtnClicked = true;
  bool _finishedBtnClicked = false;

  //YG unuudriinhiig avdag bolgo
  List<Order> _pendingAppointments = ordersData
      .where(
        (element) =>
            !element.isDone &&
            element.startDate.day.compareTo(DateTime.now().day) == 0,
      )
      .toList();
  List<Order> _finishedAppointments = ordersData
      .where(
        (element) =>
            element.isDone &&
            element.startDate.day.compareTo(DateTime.now().day) == 0,
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Today appointments list view
    Container pageBody(Size size, List<Order> data) {
      return data.length > 0
          ? (Container(
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
                          Text("Эмч:" + getDentistName(data[i].dId)),
                        ],
                      ),
                      subtitle: Text(
                        DateFormat('HH.mm').format(data[i].startDate) +
                            " - " +
                            DateFormat('HH.mm').format(data[i].endDate) +
                            " (" +
                            data[i].type +
                            ")",
                      ),
                      dense: true,
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EditAppointment(
                                    order: data[i],
                                  ),
                                ));
                          },
                          icon: Icon(Icons.edit)),
                    ),
                  );
                },
              ),
            ))
          : Container(
              height: size.height * 0.67,
              child: Center(
                child: Text(
                  _pendingBtnClicked
                      ? "No pending appointment."
                      : "No finished appointment.",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                  ),
                ),
              ),
            );
    }

    //Buttons
    Row buttonBar(Size size) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          roundedButton(
            "Pending",
            _pendingBtnClicked ? Colors.blue : Colors.white,
            _pendingBtnClicked ? Colors.white : Colors.blue,
            size,
            pendingBtnHandler,
          ),
          roundedButton(
            "Finished",
            _finishedBtnClicked ? Colors.blue : Colors.white,
            _finishedBtnClicked ? Colors.white : Colors.blue,
            size,
            finishedBtnHandler,
          ),
        ],
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(
              "Өнөөдрийн хуваарь",
              _pendingBtnClicked
                  ? " Pending appointment ${_pendingAppointments.length}"
                  : " Finished appointment ${_finishedAppointments.length}",
            ),
            buttonBar(size),
            SizedBox(height: 10),
            pageBody(
              size,
              _pendingBtnClicked ? _pendingAppointments : _finishedAppointments,
            ),
          ],
        ),
      ),
    );
  }

  void pendingBtnHandler() {
    setState(() {
      _pendingBtnClicked = true;
      _finishedBtnClicked = false;
    });
  }

  void finishedBtnHandler() {
    setState(() {
      _pendingBtnClicked = false;
      _finishedBtnClicked = true;
    });
  }

  String getDentistName(String dId) {
    return dentistsData.firstWhere((element) => element.dId == dId).firstName;
  }
}
