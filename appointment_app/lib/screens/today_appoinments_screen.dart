import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/providers/dentistProvider.dart';
import 'package:appointment_app/providers/orderProvider.dart';
import 'package:appointment_app/providers/typeProvider.dart';
import 'package:appointment_app/untilities/constants.dart';
import 'package:appointment_app/widgets/noOrder.dart';
import 'package:appointment_app/widgets/screenHeader.dart';
import 'package:flutter/material.dart';
import 'package:appointment_app/widgets/roundedButton.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'edit_appointment_screen.dart';

class TodayAppointments extends StatefulWidget {
  const TodayAppointments({Key? key}) : super(key: key);

  @override
  _TodayAppointmentsState createState() => _TodayAppointmentsState();
}

class _TodayAppointmentsState extends State<TodayAppointments> {
  bool _pendingBtnClicked = true;
  bool _finishedBtnClicked = false;

  @override
  void initState() {
    final orderMdl = Provider.of<OrderProvider>(context, listen: false);
    final typeMdl = Provider.of<TypesProvider>(context, listen: false);
    final dentistMdl = Provider.of<DentistProvider>(context, listen: false);
    super.initState();
    orderMdl.getOrdersData();
    typeMdl.getTypesData();
    dentistMdl.getDentistsData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final orderMdl = Provider.of<OrderProvider>(context);

    List<Order> _todayOrders =
        orderMdl.ordersData.where((e) => isToday(e.startDate)).toList();
    //Yg unuudriin orderuudiig haruuldag bolgoh
    List<Order> _pendingOrders =
        _todayOrders.where((e) => e.isDone == 0).toList();

    List<Order> _finishedOrders =
        _todayOrders.where((e) => e.isDone == 1).toList();

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
                          Text(getDentistName(data[i].dentist.employeeId)),
                        ],
                      ),
                      subtitle: Text(
                        DateFormat('HH.mm').format(data[i].startDate) +
                            " - " +
                            DateFormat('HH.mm').format(data[i].endDate) +
                            " (" +
                            data[i].orderType.tId.toString() +
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
          : noOrder(size, _pendingBtnClicked);
    }

    //Buttons
    Row buttonBar(Size size) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          roundedButton(
            todayScreenStr1,
            _pendingBtnClicked ? Colors.blue : Colors.white,
            _pendingBtnClicked ? Colors.white : Colors.blue,
            size.width * 0.4,
            pendingBtnHandler,
          ),
          roundedButton(
            todayScreenStr2,
            _finishedBtnClicked ? Colors.blue : Colors.white,
            _finishedBtnClicked ? Colors.white : Colors.blue,
            size.width * 0.4,
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
              todayScreenTitle,
              _pendingBtnClicked
                  ? "$todayScreenStr1 ${_pendingOrders.length}"
                  : " $todayScreenStr2 ${_finishedOrders.length}",
            ),
            buttonBar(size),
            SizedBox(height: 10),
            pageBody(
              size,
              _pendingBtnClicked ? _pendingOrders : _finishedOrders,
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

  String getDentistName(int dId) {
    final dentistMdl = Provider.of<DentistProvider>(context);
    return dentistMdl.dentistsData
        .firstWhere((element) => element.employeeId == dId)
        .firstName;
  }

  bool isToday(DateTime date) {
    DateTime now = DateTime.now();
    int result = DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
    if (result == 0) {
      return true;
    }
    return false;
  }
}
