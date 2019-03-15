import 'package:flutter/material.dart';
import 'widgets/regscreen.dart';

int rollNo;
String barcode;

void main() {
  runApp(MaterialApp(
    title: "Attendance",
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFFF4B400),
      accentColor: Colors.white,
    ),
    debugShowCheckedModeBanner: false,
    home: new RegScreen(),
  ));
}
