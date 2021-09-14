import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:appointment_app/models/order.dart';

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Order> appointments) {
    this.appointments = appointments;
  }
  Order getEvent(int index) => appointments![index] as Order;

  @override
  DateTime getStartTime(int index) => getEvent(index).startDate;

  @override
  DateTime getEndTime(int index) => getEvent(index).endDate;

  @override
  String getSubject(int index) => getEvent(index).consumerName;
}
