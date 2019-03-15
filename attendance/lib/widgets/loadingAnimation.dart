import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'dart:async';
import '../working/authentication.dart';
import 'errorAnimation.dart';
import 'package:attendance/main.dart';
import 'successAnimation.dart';

class LoaginAnimate extends StatefulWidget {
  int validity;
  LoaginAnimate(this.validity);
  @override
  _LoaginAnimateState createState() => _LoaginAnimateState(this.validity);
}

class _LoaginAnimateState extends State<LoaginAnimate> {
  int validity;
  _LoaginAnimateState(this.validity);
  @override
  initState() {
    super.initState();
    // new Timer(const Duration(seconds: 4), onClose);
    if (validity == 1) {
      authQr.sendAuth(barcode).then((_) {
        if(authQr.resCode == 201){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessAnimate()));
        }
        else{
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => ErrorAnimate()));
        }
      });
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ErrorAnimate()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlareActor(
        'assets/loading.flr',
        animation: 'Loading',
        fit: BoxFit.cover,
      ),
    );
  }

  void onClose() {
    Navigator.pop(context);
  }
}
