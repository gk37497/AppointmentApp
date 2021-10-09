import 'package:appointment_app/models/dentist.dart';
import 'package:appointment_app/models/meetingDataSource.dart';
import 'package:appointment_app/untilities/getOrderData.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DentistCalendar extends StatelessWidget {
  const DentistCalendar(this.dentist, {Key? key}) : super(key: key);
  final Dentist dentist;
  @override
  Widget build(BuildContext context) {
    // final _orderMdl = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dentist.firstName,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Expanded(
                  child: SfCalendar(
                view: CalendarView.month,
                monthViewSettings: MonthViewSettings(
                  showTrailingAndLeadingDates: false,
                  showAgenda: true,
                ),
                dataSource:
                    MeetingDataSource(getOrderData(dentist.dId, context)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
