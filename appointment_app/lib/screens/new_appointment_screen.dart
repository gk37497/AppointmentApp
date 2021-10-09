import 'package:appointment_app/database/getDataFrom.dart';
import 'package:appointment_app/models/order.dart';
import 'package:appointment_app/providers/dentistProvider.dart';
import 'package:appointment_app/providers/orderProvider.dart';
import 'package:appointment_app/providers/typeProvider.dart';
import 'package:appointment_app/screens/screenTemplate.dart';
import 'package:appointment_app/untilities/constants.dart';
import 'package:appointment_app/untilities/getOrderData.dart';
import 'package:appointment_app/widgets/dateTimePicker.dart';
import 'package:appointment_app/widgets/screenHeader.dart';
import 'package:appointment_app/widgets/roundedBoxDecoration.dart';
import 'package:appointment_app/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'dentist_calendar.dart';

class NewAppointment extends StatefulWidget {
  final jumpTo;
  const NewAppointment({Key? key, required this.jumpTo}) : super(key: key);

  @override
  _NewAppointmentState createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  int chosenDentistId = 0;
  String chosenTypeName = "";
  DateTime _selectedDate = DateTime.now();
  int _page = 0;

  List<int> isTypeClicked = List<int>.generate(5, (index) => 0);
  List<int> isDentistClicked = List<int>.generate(5, (index) => 0);

  final PageController _pageController = new PageController();
  final CalendarController _calendarController = CalendarController();
  final TextEditingController _fieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dentistMdl = Provider.of<DentistProvider>(context);
    final orderMdl = Provider.of<OrderProvider>(context);
    final typeMdl = Provider.of<TypesProvider>(context);

    Size size = MediaQuery.of(context).size;
    String _dentistName = (chosenDentistId == 0
        ? " "
        : dentistMdl.dentistsData
            .firstWhere((element) => element.dId == chosenDentistId)
            .firstName);
    String _chosenTypeName = chosenTypeName == "" ? " " : chosenTypeName;
    DateTime _endDate = _selectedDate.add(
      Duration(
        minutes: chosenTypeName == ""
            ? 0
            : typeMdl.orderTypesData
                .firstWhere((element) => element.typeName == chosenTypeName)
                .duration,
      ),
    );
    //Show list
    Container chooseDentistSection() {
      return Container(
        child: dentistMdl.loading
            ? (Container(
                child: Center(child: CircularProgressIndicator()),
              ))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: dentistMdl.dentistsData.length,
                itemBuilder: (context, i) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        chosenDentistId = dentistMdl.dentistsData[i].dId;
                        setState(() {
                          isDentistClicked =
                              isDentistClicked.map((e) => e = 0).toList();
                          isDentistClicked[i] = 1;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue[100],
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DentistCalendar(
                                          dentistMdl.dentistsData[i]),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.calendar_today_rounded,
                                  color: isDentistClicked[i] == 1
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            dentistMdl.dentistsData[i].firstName,
                            style: TextStyle(
                              color: isDentistClicked[i] == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          isDentistClicked[i] == 1
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  );
                },
              ),
      );
    }

    Container chooseTypeSection() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: FutureBuilder(
            future: getTypesFromDb(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return Container(child: Center(child: Icon(Icons.error)));
              }
              return (GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isTypeClicked =
                              isTypeClicked.map((e) => e = 0).toList();
                          isTypeClicked[i] = 1;
                          chosenTypeName = snapshot.data[i].typeName;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.clean_hands,
                            color: isTypeClicked[i] == 1
                                ? Colors.white
                                : Colors.blue.shade400,
                          ),
                          SizedBox(height: 5),
                          Text(
                            snapshot.data[i].typeName,
                            style: TextStyle(
                              color: isTypeClicked[i] == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            "${snapshot.data[i].duration.toString()} min",
                            style: TextStyle(
                              color: isTypeClicked[i] == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          isTypeClicked[i] == 1
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  );
                },
              ));
            }),
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

    Container pageBody(
        Container chooseDentistSection(),
        Container chooseTypeSection(),
        OrderProvider orderMdl,
        Container verifyAppointment()) {
      return Container(
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
                getOrderData(chosenDentistId, context),
              ),
            ),
            Card(
              child: verifyAppointment(),
            ),
          ],
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: _onPageChanged,
        ),
      );
    }

    return pageTemplate(
      [
        header(
          addOrderScreenTitle,
          "${chosenDentistId == 0 ? "" : _dentistName} ${chosenTypeName == "" ? "" : "$chosenTypeName"}",
        ),
        SizedBox(
          height: size.height * 0.64,
          child: pageBody(chooseDentistSection, chooseTypeSection, orderMdl,
              verifyAppointment),
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
    final orderMdl = Provider.of<OrderProvider>(context, listen: false);
    final typeMdl = Provider.of<TypesProvider>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      Order newOrder = new Order(
        oId: 1,
        dId: chosenDentistId,
        consumerName: _fieldController.text,
        startDate: _selectedDate,
        endDate: _selectedDate.add(
          Duration(
              minutes: chosenTypeName == ""
                  ? 0
                  : typeMdl.orderTypesData
                      .firstWhere(
                          (element) => element.typeName == chosenTypeName)
                      .duration),
        ),
        isDone: 0,
        tId: typeMdl.orderTypesData
            .firstWhere((e) => e.typeName == chosenTypeName)
            .tId,
      );
      orderMdl.addOrder(newOrder, context);
      widget.jumpTo(2);
    }
  }
}
