import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SuccessAnimate extends StatefulWidget {
  @override
  _SuccessAnimateState createState() => _SuccessAnimateState();
}

class _SuccessAnimateState extends State<SuccessAnimate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: FlareActor('assets/success.flr',animation: 'gpay',fit: BoxFit.contain,),
      ),
    );
  }
}