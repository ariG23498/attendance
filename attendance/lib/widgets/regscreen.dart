import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import '../widgets/myapp.dart';
import '../main.dart';

class RegScreen extends StatefulWidget {
  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  int roll = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Center(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("ROll NO : $roll"),
              new NumberPicker.integer(
                initialValue: 1,
                minValue: 1,
                maxValue: 200,
                onChanged: (newValue) {
                  setState(() {
                    roll = newValue;
                    rollNo = newValue;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => MyApp()));
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
