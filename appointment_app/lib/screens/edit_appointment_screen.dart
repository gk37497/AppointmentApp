import 'package:appointment_app/models/dentist.dart';
import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/models/type.dart';
import 'package:appointment_app/widgets/dateTimePicker.dart';
import 'package:appointment_app/widgets/roundedBoxDecoration.dart';
import 'package:appointment_app/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EditAppointment extends StatefulWidget {
  const EditAppointment({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  _EditAppointmentState createState() => _EditAppointmentState();
}

class _EditAppointmentState extends State<EditAppointment> {
  List<DropdownMenuItem<String>> _dentistDropItems = dentistsData
      .map((e) => DropdownMenuItem<String>(
            child: Text(e.firstName),
            value: e.firstName,
          ))
      .toList();
  List<DropdownMenuItem<String>> _typeDropItems = appointmentTypesData
      .map((e) => DropdownMenuItem<String>(
            child: Text(e.name),
            value: e.name,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    String _dentistDropdownValue = dentistsData
        .firstWhere((element) => element.dId == widget.order.dId)
        .firstName;
    String _typeDropdownValue = appointmentTypesData
        .firstWhere((element) => element.name == widget.order.type)
        .name;

    Size size = MediaQuery.of(context).size;
    DateTime _selectedDate = widget.order.startDate;
    CalendarController _calendarController = CalendarController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit appointment"),
        elevation: 10,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(widget.order.consumerName,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: roundedBoxDecoration(Colors.white),
                    child: DropdownButton<String>(
                      value: _dentistDropdownValue,
                      items: _dentistDropItems,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _dentistDropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                  Container(
                    decoration: roundedBoxDecoration(Colors.white),
                    child: DropdownButton<String>(
                      value: _typeDropdownValue,
                      items: _typeDropItems,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _typeDropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: chooseDateSection(
                _selectedDate,
                _calendarController,
                onDateChanged,
                onSelectionChanged,
                ordersData,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  roundedButton(
                      "Close", Colors.white, Colors.blue, size, () {}),
                  roundedButton("Edit", Colors.blue, Colors.white, size, () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onDateChanged(DateTime date) {}
  void onSelectionChanged(CalendarSelectionDetails details) {}
}
