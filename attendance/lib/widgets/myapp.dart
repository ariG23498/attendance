import 'package:flutter/material.dart';
import 'attendAnimation.dart';
import '../working/scanning.dart';
import '../main.dart';
import '../working/authentication.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int validity = 0;
  int resCode = 400;
  String status = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Text(
          "Roll No : $rollNo $status",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.grey),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          scan.qrScan().then((_) {
            this.validity = scan.validity;
            print("Validity : ${this.validity}");
            if (this.validity == 1) {
              authQr.sendAuth(barcode).then((_) {
                if (authQr.resCode == 201) {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SuccessAnimate())).then((_) {
                    setState(() {
                      status = "Validated";
                    });
                  });
                } else {
                  setState(() {
                    status = "Invalid";
                  });
                }
              });
            } else {
              setState(() {
                status = "Ivalid";
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
