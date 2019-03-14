import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'authentication.dart';

class Scanning {
  //validity is the validity code
  //0 : not checked
  //1 : valid attendance
  //2 : invalid attendance
  // int validity = 0;
  String barcode;

  Future<bool> qrScan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      this.barcode = barcode;
      authQr.sendAuth(this.barcode).then((onValue){
        if(onValue){
          return true;
        }
      });
      // this.validity = 1;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        this.barcode = 'The user did not grant the camera permission!';
        return false;
        // this.validity = 2;
      } else {
        this.barcode = 'Unknown error: $e';
        // this.validity = 2;
        return false;
      }
    } on FormatException {
      this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)';
      // this.validity = 2;
      return false;
    } catch (e) {
      this.barcode = 'Unknown error : $e';
      // this.validity = 2;
      return false;
    }
  }
}

Scanning scan = new Scanning();
