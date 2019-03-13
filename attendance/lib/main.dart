import 'working/scanning.dart';
import 'working/authentication.dart';
import 'package:flutter/material.dart';
import 'pages/attendAnimation.dart';

void main() {
  runApp(MaterialApp(
    title: "Attendance",
    debugShowCheckedModeBanner: false,
    //home: new MyApp(),
    home: SuccessAnimate(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String barcode = "Welcome To the App";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Attendance"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text(
          barcode,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          scan.qrScan().then((_) {
            setState(() {
              this.barcode = scan.barcode;
            });
          });
        },
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
