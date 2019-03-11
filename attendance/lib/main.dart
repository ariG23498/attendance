import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: "Attendance",
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String barcode = "";
  String error = "";
  Future _qrScan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        //this.barcode = barcode.substring(30,barcode.length - 2);
        this.barcode = barcode;
        sendAuth();
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  Future<void> sendAuth() async {
    var auth = {'message': 'hello'};
    print(auth);
    var s = await http.put(Uri.parse("${barcode}33"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(auth),
        encoding: Encoding.getByName("utf-8"));
    Map l = json.decode(s.body);
    error = l['code'];
    print("Code is $error");
    print(l);

  }

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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _qrScan,
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
