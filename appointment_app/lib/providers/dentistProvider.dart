import 'package:appointment_app/database/getDataFrom.dart';
import 'package:appointment_app/models/employee.dart';
import 'package:flutter/material.dart';

class DentistProvider with ChangeNotifier {
  List<Employee> dentistsData = [];
  bool loading = false;
  bool hasData = false;

  getDentistsData() async {
    loading = true;
    print(dentistsData);
    dentistsData = (await getDentists())!;
    loading = false;
    notifyListeners();
  }
}
