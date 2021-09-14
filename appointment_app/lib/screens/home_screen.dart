import 'package:appointment_app/screens/new_appointment_screen.dart';
import 'package:appointment_app/screens/today_appoinments_screen.dart';
import 'package:flutter/material.dart';

import 'all_appointments_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

PageController pageController = PageController();

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  //Login page builder is here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: [
            Container(color: Colors.white, child: TodayAppointments()),
            Container(
                color: Colors.white,
                child: NewAppointment(
                  jumpTo: navigationTapped,
                )),
            Container(color: Colors.white, child: AppointmentsPage()),
          ],
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.today,
              color: _page == 0 ? Colors.blue : Colors.black,
            ),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: _page == 1 ? Colors.blue : Colors.black,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment,
              color: _page == 2 ? Colors.blue : Colors.black,
            ),
            label: 'Appointments',
          ),
        ],
        elevation: 30,
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
