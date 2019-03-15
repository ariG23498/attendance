import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class ErrorAnimate extends StatefulWidget {
  @override
  _ErrorAnimateState createState() => _ErrorAnimateState();
}

class _ErrorAnimateState extends State<ErrorAnimate> {
  @override
  initState() {
    super.initState();
    new Timer(const Duration(seconds: 3), onClose);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Container(
          child: FlareActor(
            'assets/error.flr',
            animation: 'error',
            fit: BoxFit.contain,
          ),
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.5,
        ),
        // child: FlareActor('assets/error.flr',animation: 'error',fit: BoxFit.contain,),
      ),
    );
  }

  void onClose() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
