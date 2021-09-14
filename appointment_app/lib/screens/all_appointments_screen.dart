import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/screens/search_screen.dart';
import 'package:appointment_app/widgets/screenHeader.dart';
import 'package:appointment_app/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  bool _upcomingBtnClicked = true;
  bool _pastBtnClicked = false;

  List<Order> _upcomingAppointments =
      ordersData.where((element) => !element.isDone).toList();
  List<Order> _pastAppointments =
      ordersData.where((element) => element.isDone).toList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //Page header
    Row pageHeader() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          header(
            "All appointments",
            _upcomingBtnClicked
                ? " Upcoming appointment ${_upcomingAppointments.length}"
                : " Completed appointment ${_pastAppointments.length}",
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

    //All appointment page body
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
                            data[i].type +
                            ")",
                      ),
                      dense: true,
                      trailing: Icon(Icons.edit),
                    ),
                  );
                },
              ),
            ))
          : Container(
              height: size.height * 0.68,
              child: Center(
                child: Text(
                  _upcomingBtnClicked
                      ? "No upComing appointment."
                      : "No completed appointment.",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                  ),
                ),
              ),
            );
    }

    Row buttonBar(Size size) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          roundedButton(
            "Upcoming",
            _upcomingBtnClicked ? Colors.blue : Colors.white,
            _upcomingBtnClicked ? Colors.white : Colors.blue,
            size,
            upcomingBtnHandler,
          ),
          roundedButton(
            "Completed",
            _pastBtnClicked ? Colors.blue : Colors.white,
            _pastBtnClicked ? Colors.white : Colors.blue,
            size,
            pastBtnHandler,
          ),
        ],
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: pageHeader(),
              height: size.height * 0.14,
            ),
            buttonBar(size),
            pageBody(
              size,
              _upcomingBtnClicked ? _upcomingAppointments : _pastAppointments,
            ),
          ],
        ),
      ),
    );
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
}
