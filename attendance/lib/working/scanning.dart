import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Scanning {
  //validity is the validity code
  //0 : not checked
  //1 : valid attendance
  //2 : invalid attendance
  int validity = 0;
  String barcode;

  Future qrScan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      this.barcode = barcode;
      this.validity = 1;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        this.barcode = 'The user did not grant the camera permission!';
        this.validity = 2;
      } else {
        this.barcode = 'Unknown error: $e';
        this.validity = 2;
      }
    } on FormatException {
      this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)';
      this.validity = 2;
    } catch (e) {
      this.barcode = 'Unknown error : $e';
      this.validity = 2;
    }
  }
}

Scanning scan = new Scanning();
