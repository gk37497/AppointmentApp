import 'package:appointment_app/models/dentist.dart';
import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/models/type.dart';
import 'package:appointment_app/widgets/dateTimePicker.dart';
import 'package:appointment_app/widgets/screenHeader.dart';
import 'package:appointment_app/widgets/roundedBoxDecoration.dart';
import 'package:appointment_app/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class NewAppointment extends StatefulWidget {
  final jumpTo;
  const NewAppointment({Key? key, required this.jumpTo}) : super(key: key);

  @override
  _NewAppointmentState createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  String dId = "";
  String chosenTypeName = "";
  DateTime _selectedDate = DateTime.now();
  int _page = 0;

  List<int> isClicked = List<int>.generate(5, (index) => 0);

  final PageController _pageController = new PageController();
  final CalendarController _calendarController = CalendarController();
  final TextEditingController _fieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String _dentistName = dId == ""
        ? " "
        : dentistsData.firstWhere((element) => element.dId == dId).firstName;
    String _chosenTypeName = chosenTypeName == "" ? " " : chosenTypeName;
    DateTime _endDate = _selectedDate.add(
      Duration(
          minutes: chosenTypeName == ""
              ? 0
              : appointmentTypesData
                  .firstWhere((element) => element.name == chosenTypeName)
                  .duration),
    );
    //Show list
    Container chooseDentistSection() {
      return Container(
        // decoration: roundedBoxDecoration(Colors.white),
        child: ListView.builder(
            itemCount: dentistsData.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  leading: Radio(
                    value: dentistsData[i].dId,
                    groupValue: dId,
                    onChanged: (String? value) {
                      setState(() {
                        dId = value!;
                      });
                      print(dId);
                    },
                  ),
                  title: Text(dentistsData[i].lastName +
                      " " +
                      dentistsData[i].firstName),
                  subtitle: Text(dentistsData[i].phoneNumber.toString()),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.calendar_today_rounded)),
                ),
              );
            }),
      );
    }

    Container chooseTypeSection() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: appointmentTypesData.length,
          itemBuilder: (BuildContext context, int i) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isClicked = isClicked.map((e) => e = 0).toList();
                    isClicked[i] = 1;
                    chosenTypeName = appointmentTypesData[i].name;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.clean_hands,
                      color: isClicked[i] == 1
                          ? Colors.white
                          : Colors.blue.shade400,
                    ),
                    SizedBox(height: 5),
                    Text(
                      appointmentTypesData[i].name,
                      style: TextStyle(
                        color: isClicked[i] == 1 ? Colors.white : Colors.black,
                      ),
                    )
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    isClicked[i] == 1 ? Colors.blue : Colors.transparent,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    Container verifyAppointment() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _chosenTypeName + " with\n" + "Dentist " + _dentistName,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.event_available,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    DateFormat('EEE, MMM d').format(_selectedDate),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    DateFormat('HH:mm').format(_selectedDate) +
                        "-" +
                        DateFormat('HH:mm').format(_endDate),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _fieldController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Phone number"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some number';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(
                "Add new appointment",
                "${dId == "" ? "" : _dentistName} ${chosenTypeName == "" ? "" : "$chosenTypeName"}",
              ),
              SizedBox(
                height: size.height * 0.64,
                child: PageView(
                  children: [
                    Container(
                      // decoration: roundedBoxDecoration(Colors.white),
                      child: chooseDentistSection(),
                    ),
                    Container(
                      decoration: roundedBoxDecoration(Colors.white),
                      child: chooseTypeSection(),
                    ),
                    Container(
                      decoration: roundedBoxDecoration(Colors.white),
                      child: chooseDateSection(
                          _selectedDate,
                          _calendarController,
                          _onDateChanged,
                          _onSelectionChanged,
                          ordersData),
                    ),
                    Card(
                      child: verifyAppointment(),
                    ),
                  ],
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: _onPageChanged,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  roundedButton(
                      "Back", Colors.white, Colors.blue, size, backBtnHandler),
                  roundedButton(
                    "${_page == 3 ? "Confirm" : "Next"}",
                    Colors.blue,
                    Colors.white,
                    size,
                    _page == 3 ? confirmBtnHandler : nextBtnHandler,
                  ),
                ],
              ),
            ],
          )),
    );
  }

  void backBtnHandler() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void nextBtnHandler() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    _calendarController.displayDate = _selectedDate;
  }

  void _onSelectionChanged(CalendarSelectionDetails details) {
    Future.delayed(
      Duration(milliseconds: 1),
      () => setState(
        () {
          _selectedDate = details.date!;
        },
      ),
    );
  }

  void confirmBtnHandler() {
    if (_formKey.currentState!.validate()) {
      ordersData.add(
        new Order(
          dId: dId,
          aId: "a110",
          consumerName: _fieldController.text,
          startDate: _selectedDate,
          endDate: _selectedDate.add(
            Duration(
                minutes: chosenTypeName == ""
                    ? 0
                    : appointmentTypesData
                        .firstWhere((element) => element.name == chosenTypeName)
                        .duration),
          ),
          isDone: false,
          type: chosenTypeName,
        ),
      );

      widget.jumpTo(2);
    }
  }
}
