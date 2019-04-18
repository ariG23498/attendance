import 'package:flutter/material.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}

Image img;

void main() {
  runApp(MaterialApp(
    title: "Sockets",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  lol() async {
    // debugPrint("Hello");
    // IO.Socket socket = IO.io('https://attandance-app.herokuapp.com/getqr');
    // debugPrint(socket.toString());
    // debugPrint("Hello");
    // socket.on('connect', (_) {
    //   debugPrint("connect");
    //   socket.emit('sendqr', 0);
    // });
    // socket.on('base64qr', (data) => debugPrint(data));
    // socket.on('disconnect', (_) => print('disconnect'));
    // // socket.on('fromServer', (_) => print(_));
    SocketIO socket = await SocketIOManager().createInstance(
        'https://attandance-app.herokuapp.com/getqr'); //TODO change the port  accordingly

    socket.onConnect((data) {
      print("connected...");
      print(data);
      socket.emit("sendqr", ["Hello world!"]);
      Timer.periodic(new Duration(seconds: 40), (_) {
        socket.emit("sendqr", ["Hello world!"]);
      });
    });
    socket.on("base64qr", (data) {
      //sample event
      print("news");
      print(data);
      setState(() {
        img = imageFromBase64String(data);
      });
    });
    socket.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: img,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          lol();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
