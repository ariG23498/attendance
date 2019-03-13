import 'working/scanning.dart';
import 'package:flutter/material.dart';
import 'pages/attendAnimation.dart';

void main() {
  runApp(MaterialApp(
    title: "Attendance",
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFFF4B400),
      accentColor: Color(0xFFF4B400),
    ),
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
    //home: SuccessAnimate(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String barcode = "";
  int validity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Attendance",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text(
          barcode,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.grey),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          scan.qrScan().then((_) {
            this.validity = scan.validity;
            print(this.validity);
            if (this.validity == 1) {
              print("Hello");
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => SuccessAnimate())).then((_) {
                setState(() {
                  this.barcode = "Validated";
                });
              });
            } else {
              setState(() {
                this.barcode = scan.barcode;
              });
            }
          });
        },
        icon: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
        label: Text(
          "Scan",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
