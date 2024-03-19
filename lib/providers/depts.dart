import 'package:flutter/material.dart';
import "../database/initialize_database.dart";

class Depts with ChangeNotifier {
  List<Map> _depts = [];

  List<Map> get depts {
    return [..._depts];
  }

  void updateDepts() async {
    PosData db = PosData();
    List<Map> lst = await db.readData("SELECT * FROM 'dept'");

    if (lst.isNotEmpty) {
      print(lst);
    }
    notifyListeners();
  }
}
