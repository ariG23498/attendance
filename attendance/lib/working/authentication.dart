import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import '../main.dart';

class AuthenticateQr {

  int resCode;

  Future sendAuth(String barcode) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd.MM.yy').format(now);
    var auth = {'message': 'hello'};
    var s = await http.put(Uri.parse("$barcode$formattedDate/$rollNo"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(auth),
        encoding: Encoding.getByName("utf-8"));
    resCode = s.statusCode;
    print("In the auth part ResponseCode is : ${s.statusCode}");
  }
}

AuthenticateQr authQr = new AuthenticateQr();
