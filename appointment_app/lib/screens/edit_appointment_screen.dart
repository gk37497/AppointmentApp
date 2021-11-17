import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/providers/dentistProvider.dart';
import 'package:appointment_app/providers/orderProvider.dart';
import 'package:appointment_app/providers/typeProvider.dart';
import 'package:appointment_app/untilities/getOrderData.dart';
import 'package:appointment_app/widgets/dateTimePicker.dart';
import 'package:appointment_app/widgets/roundedBoxDecoration.dart';
import 'package:appointment_app/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EditAppointment extends StatefulWidget {
  const EditAppointment({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  _EditAppointmentState createState() => _EditAppointmentState();
}

class _EditAppointmentState extends State<EditAppointment> {
  DateTime _selectedDate = DateTime.now();
  final CalendarController _calendarController = CalendarController();

//dropdown button utguud hadgalah heseg
  String _dentistDropdownInitialValue = '';
  String _typeDropdownInitialValue = '';

  int _dId = 0;

  @override
  void initState() {
    final typeMdl = Provider.of<TypesProvider>(context, listen: false);
    final dentistMdl = Provider.of<DentistProvider>(context, listen: false);
    super.initState();
    typeMdl.getTypesData();
    _dentistDropdownInitialValue = dentistMdl.dentistsData
        .firstWhere(
            (element) => element.employeeId == widget.order.dentist.employeeId)
        .firstName;
    _typeDropdownInitialValue = typeMdl.orderTypesData
        .firstWhere((element) => element.tId == widget.order.orderType.tId)
        .typeName;
    _dId = widget.order.dentist.employeeId;
  }

  @override
  Widget build(BuildContext context) {
    final dentistMdl = Provider.of<DentistProvider>(context);
    final typeMdl = Provider.of<TypesProvider>(context);
    final orderMdl = Provider.of<OrderProvider>(context);

    List<DropdownMenuItem<String>> _dentistDropItems = dentistMdl.dentistsData
        .map((e) => DropdownMenuItem<String>(
              child: Text(e.firstName),
              value: e.firstName,
            ))
        .toList();
    List<DropdownMenuItem<String>> _typeDropItems = typeMdl.orderTypesData
        .map((e) => DropdownMenuItem<String>(
              child: Text(e.typeName),
              value: e.typeName,
            ))
        .toList();

    Size size = MediaQuery.of(context).size;

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
                      value: _dentistDropdownInitialValue,
                      items: _dentistDropItems,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _dentistDropdownInitialValue = newValue!;
                          _dId = dentistMdl.dentistsData
                              .firstWhere((element) =>
                                  element.firstName ==
                                  _dentistDropdownInitialValue)
                              .employeeId;
                        });
                        print(_dId);
                      },
                    ),
                  ),
                  Container(
                    decoration: roundedBoxDecoration(Colors.white),
                    child: DropdownButton<String>(
                      value: _typeDropdownInitialValue,
                      items: _typeDropItems,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _typeDropdownInitialValue = newValue!;
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
                getOrderData(_dId, context),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  roundedButton(
                    "Close",
                    Colors.white,
                    Colors.blue,
                    80,
                    closeBtnHandler,
                  ),
                  roundedButton(
                    "Edit",
                    Colors.blue,
                    Colors.white,
                    80,
                    () {
                      // Order editingOrder = new Order(
                      //   dentist_id: _dId,
                      //   orderId: widget.order.orderId,
                      //   tId: typeMdl.orderTypesData
                      //       .firstWhere(
                      //           (e) => e.typeName == _typeDropdownInitialValue)
                      //       .tId,
                      //   consumerName: widget.order.consumerName,
                      //   startDate: _selectedDate,
                      //   endDate: _selectedDate.add(
                      //     Duration(
                      //         minutes: _typeDropdownInitialValue == ""
                      //             ? 0
                      //             : typeMdl.orderTypesData
                      //                 .firstWhere((element) =>
                      //                     element.typeName ==
                      //                     _typeDropdownInitialValue)
                      //                 .duration),
                      //   ),
                      //   isDone: 0,
                      // );
                      // print(editingOrder.toJson());
                      // orderMdl.updateOrder(editingOrder, context);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void closeBtnHandler() {
    Navigator.pop(context);
  }

  void editBtnHandler() {
    print(_selectedDate);
  }

  void onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
    });

    _calendarController.displayDate = _selectedDate;
  }

  void onSelectionChanged(CalendarSelectionDetails details) {
    Future.delayed(
      Duration(milliseconds: 1),
      () => setState(
        () {
          _selectedDate = details.date!;
        },
      ),
    );
  }
}
