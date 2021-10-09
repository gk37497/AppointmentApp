import 'package:appointment_app/database/getDataFrom.dart';
import 'package:appointment_app/models/dentist.dart';
import 'package:flutter/material.dart';

class DentistProvider with ChangeNotifier {
  List<Dentist> dentistsData = [];
  bool loading = false;
  bool hasData = false;

  getDentistsData() async {
    loading = true;
    dentistsData = (await getDentists());
    loading = false;
    notifyListeners();
  }
}
