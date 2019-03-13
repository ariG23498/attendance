import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticateQr {
  Future<void> sendAuth(String barcode) async {
    var auth = {'message': 'hello'};
    print(auth);
    var s = await http.put(Uri.parse("${barcode}33"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(auth),
        encoding: Encoding.getByName("utf-8"));
    Map l = json.decode(s.body);
    String error = l['code'];
    print("Code is $error");
    print(l);
  }
}

AuthenticateQr authQr = new AuthenticateQr();
