import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/providers/orderProvider.dart';
import 'package:appointment_app/providers/typeProvider.dart';
import 'package:appointment_app/screens/new_appointment_screen.dart';
import 'package:appointment_app/untilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DentistHomeScreen extends StatefulWidget {
  const DentistHomeScreen({Key? key, required this.logout}) : super(key: key);
  final logout;
  @override
  _DentistHomeScreenState createState() => _DentistHomeScreenState();
}

PageController _pageController = PageController();

class _DentistHomeScreenState extends State<DentistHomeScreen> {
  int _page = 0;

  ListView drawerItems(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Text("Dentist Name"),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        ListTile(
          leading: Icon(Icons.schedule_outlined),
          title: Text("Today Schedule"),
          tileColor: _page == 0 ? Colors.blue : Colors.transparent,
          onTap: () {
            navigationTapped(0);
            Navigator.pop(context);
          },
          trailing: Text("5"),
        ),
        ListTile(
          title: Text("Calendar"),
          leading: Icon(Icons.calendar_today),
          tileColor: _page == 1 ? Colors.blue : Colors.transparent,
          trailing: Text("15"),
          onTap: () {
            navigationTapped(1);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text("Add appointment"),
          leading: Icon(Icons.add_task_rounded),
          tileColor: _page == 2 ? Colors.blue : Colors.transparent,
          onTap: () {
            navigationTapped(2);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Container calendar() => Container(child: Text("Calendar"));

  Container schedule(List<Order> orders) => Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  DateFormat('EEE,MMMM d').format(DateTime.now()),
                )),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [listItem(orders[i]), SizedBox(height: 10)],
                  );
                },
              ),
            ),
          ],
        ),
      );

  Container listItem(Order order) {
    final typeMdl = Provider.of<TypesProvider>(context);
    print(typeMdl.orderTypesData.map((e) => e.typeName));
    String _typeName = typeMdl.orderTypesData
        .firstWhere((e) => e.tId == order.orderType.tId)
        .typeName;
    TypeDetials _typeDetial =
        orderTypeDetials.firstWhere((element) => element.name == _typeName);

    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: _typeDetial.color.withOpacity(0.3),
        border: Border(left: BorderSide(width: 5.0, color: _typeDetial.color)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(143, 148, 251, .2),
            blurRadius: 20.0,
            offset: Offset(0, 100),
          ),
        ],
      ),
      child: Center(
        child: ListTile(
          title: Text(order.consumerName),
          subtitle: Text(
            _typeName +
                "\n" +
                dateConvert(order.startDate) +
                "-" +
                dateConvert(order.endDate),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(_typeDetial.iconName),
          ),
          isThreeLine: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orderMdl = Provider.of<OrderProvider>(context);
    //Side menu items
    List<String> _pageTitles = ["Өнөөдрийн хуваарь", "Календар", "Үзлэг нэмэх"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageTitles[_page],
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: logout,
            icon: Icon(Icons.logout_sharp),
          )
        ],
      ),
      body: PageView(
        children: [
          schedule(orderMdl.ordersData),
          calendar(),
          NewAppointment(jumpTo: () {})
        ],
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      drawer: Drawer(
        child: drawerItems(context),
      ),
    );
  }

  void logout() {
    widget.logout();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    final orderMdl = Provider.of<OrderProvider>(context, listen: false);
    final typeMdl = Provider.of<TypesProvider>(context, listen: false);
    super.initState();
    orderMdl.getOrdersData();
    typeMdl.getTypesData();
  }

  String dateConvert(DateTime date) {
    return DateFormat('HH.mm').format(date);
  }
}
