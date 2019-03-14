import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import '../main.dart';

class AuthenticateQr {
  Future<bool> sendAuth(String barcode) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd.MM.yy').format(now);
    print(formattedDate);
    var auth = {'message': 'hello'};
    print(auth);
    var s = await http.put(Uri.parse("$barcode$formattedDate/$rollNo"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(auth),
        encoding: Encoding.getByName("utf-8"));
    // Map l = json.decode(s.body);
    // print("STatus code ${s.statusCode}");
    // String error = l['code'];
    // print("Code is $error");
    // print(l);
    if (s.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}

AuthenticateQr authQr = new AuthenticateQr();
