import 'dart:io';

import 'package:flutter/material.dart';
import "package:magicpos/screens/product_card.dart";

import "screens/home_screen.dart";
import "database/initialize_database.dart";
import "screens/pos_screen.dart";

const List<String> functionKeysNames = [
  "ca",
  "ch",
  "vi1",
  "vi2",
  "chk",
  "pd",
  "rc",
  "plus",
  "minus",
  "plus_per",
  "minus_per",
];

void main() async {
  runApp(const MyApp());
  PosData db = PosData();
  List<Map> lst = await db.readData("SELECT * FROM 'dept'");
  if (lst.isEmpty) {
    for (int i = 0; i < functionKeysNames.length; i++) {
      int response = await db.insertData(
          "INSERT INTO 'functions_keys'('key_name') VALUES('${functionKeysNames[i]}')");
      response;
    }
    await db.insertData(
        "INSERT INTO departments (section_name) VALUES('undefined')");

    for (int i = 1; i < 17; i++) {
      int response =
          await db.insertData("INSERT INTO 'dept'('name') VALUES('dept$i')");
      response;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        PosScreen.route: (context) => const PosScreen(),
        ProductCard.route: (context) => ProductCard(
              productsController: List.filled(4, TextEditingController()),
              productsStrings: ["", "", "unit1", "unit2", "unit3"],
              unitsController:
                  List.filled(7, List.filled(3, TextEditingController())),
              disableUnits: List<bool>.filled(3, true),
              productImage: File(""),
              thereIsImage: false,
              productId: -1,
              productsType: '',
            ),
      },
    );
  }
}
