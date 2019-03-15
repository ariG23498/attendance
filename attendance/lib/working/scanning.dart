import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:attendance/main.dart';

class Scanning {
  //validity is the validity code
  //0 : not checked
  //1 : valid attendance
  //2 : invalid attendance
  int validity;

  Future qrScan() async {
    try {
      String bar = await BarcodeScanner.scan();
      //here barcode global is set
      barcode = bar;
      this.validity = 1;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        // barcode = 'The user did not grant the camera permission!';
        this.validity = 2;
      } else {
        // barcode = 'Unknown error: $e';
        this.validity = 2;
      }
    } on FormatException {
      // barcode = 'null (User returned using the "back"-button before scanning anything. Result)';
      this.validity = 2;
    } catch (e) {
      // barcode = 'Unknown error : $e';
      this.validity = 2;
    }
  }
}

Scanning scan = new Scanning();
