import 'package:appointment_app/models/meetingDataSource.dart';
import 'package:appointment_app/models/order.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

Container chooseDateSection(
  DateTime selectedDate,
  CalendarController controller,
  onDateChanged,
  onSelectionChanged,
  List<Order> data,
) {
  return Container(
    child: Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: selectedDate,
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,
          onDateChange: onDateChanged,
        ),
        Expanded(
          child: SfCalendar(
            view: CalendarView.day,
            showNavigationArrow: true,
            headerHeight: 0,
            viewHeaderHeight: -1,
            initialSelectedDate: selectedDate,
            initialDisplayDate: selectedDate,
            controller: controller,
            timeSlotViewSettings: TimeSlotViewSettings(
              timeFormat: 'H.mm',
              startHour: 9,
              endHour: 20,
            ),
            dataSource: MeetingDataSource(data),
            onSelectionChanged: onSelectionChanged,
          ),
        ),
      ],
    ),
  );
}
