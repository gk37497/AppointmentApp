import 'package:appointment_app/models/employee.dart';
import 'package:appointment_app/models/type.dart';
import 'package:appointment_app/providers/dentistProvider.dart';
import 'package:appointment_app/providers/typeProvider.dart';
import 'package:appointment_app/screens/dentist_profile_screen.dart';
import 'package:appointment_app/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Dentist nemeh bolon hasah zasah uildel hiine mun emchilgeenii type hiih zasah hasah

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

PageController _pageController = PageController();

Scaffold dentistSection(List<Employee> data) => Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, i) {
          return ListTile(
            leading: CircleAvatar(),
            title: Text(data[i].firstName + " " + data[i].lastName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("username"), Text("password")],
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
            ),
            isThreeLine: true,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DentistProfile()));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

class _AdminScreenState extends State<AdminScreen> {
  Scaffold typeSection(List<OrderType> data) => Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
          ),
          itemCount: data.length,
          itemBuilder: (BuildContext context, i) {
            return Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.clean_hands),
                      SizedBox(height: 5),
                      Text(data[i].typeName),
                      SizedBox(height: 5),
                      Text(data[i].duration.toString()),
                    ],
                  ),
                ));
          },
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: newType, child: Icon(Icons.add)),
      );
  int _page = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeNameFieldController =
      TextEditingController();
  final TextEditingController _typeDurationFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _dentistMdl = Provider.of<DentistProvider>(context);
    final _typeMdl = Provider.of<TypesProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: PageView(
          children: [
            dentistSection(_dentistMdl.dentistsData),
            typeSection(_typeMdl.orderTypesData),
          ],
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Admin"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.schedule_outlined),
              title: Text("Dentist"),
              tileColor: _page == 0 ? Colors.blue : Colors.transparent,
              onTap: () {
                navigationTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule_outlined),
              title: Text("Type"),
              tileColor: _page == 1 ? Colors.blue : Colors.transparent,
              onTap: () {
                navigationTapped(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    final typeMdl = Provider.of<TypesProvider>(context, listen: false);
    final dentistMdl = Provider.of<DentistProvider>(context, listen: false);
    super.initState();
    typeMdl.getTypesData();
    dentistMdl.getDentistsData();
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void newType() {
    Size _size = MediaQuery.of(context).size;
    final _typeMdl = Provider.of<TypesProvider>(context, listen: false);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _typeNameFieldController,
                      decoration: InputDecoration(labelText: "Type name"),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "please enter some text";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _typeDurationFieldController,
                      decoration: InputDecoration(labelText: "Type duration"),
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "please enter duration";
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        roundedButton("close", Colors.white, Colors.blue, 100,
                            () {
                          Navigator.pop(context);
                        }),
                        roundedButton(
                          "save",
                          Colors.blue,
                          Colors.white,
                          100,
                          () {
                            if (_formKey.currentState!.validate()) {
                              _typeMdl.addOrderType(
                                  OrderType(
                                    duration: int.parse(
                                        _typeDurationFieldController.text),
                                    tId: 1,
                                    typeName: _typeNameFieldController.text,
                                  ),
                                  context);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
