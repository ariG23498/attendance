import 'package:flutter/material.dart';
import 'attendAnimation.dart';
import '../working/scanning.dart';
import '../main.dart';

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
      body: new Center(
        child: new Text(
          "Roll No : $rollNo",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.grey),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          scan.qrScan().then((onValue) {
            // this.validity = scan.validity;
            if (onValue) {
              this.validity = 1;
            } else {
              this.validity = 2;
            }
            print("Validity : ${this.validity}");
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
          color: Color(0xFFF4B400),
        ),
        label: Text(
          "Scan",
          style: TextStyle(color: Color(0xFFF4B400)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
