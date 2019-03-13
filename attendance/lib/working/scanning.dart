import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Scanning{
  String barcode = "";

  Future qrScan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      this.barcode = barcode;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        this.barcode = 'The user did not grant the camera permission!';
      } else {
        this.barcode = 'Unknown error: $e';        
      }
    } on FormatException {
      this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)';
    } catch (e) {
      this.barcode = 'Unknown error : $e';
    }
  }

}

Scanning scan = new Scanning();