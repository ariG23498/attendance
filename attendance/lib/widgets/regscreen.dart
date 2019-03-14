import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import '../widgets/myapp.dart';
import '../main.dart';

class RegScreen extends StatefulWidget {
  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  int _roll = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("P i c k e r",style: TextStyle(color: Color(0xFFF4B400),fontWeight: FontWeight.w600,fontSize: 20.0),),
              Card(
                margin: EdgeInsets.fromLTRB(50.0,10.0,50.0,0.0),
                color: Color(0xFFF4B400),
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // new Text("ROll NO : $_roll"),
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: 'Roll No : ',
                          style: TextStyle(
                              
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                        TextSpan(
                          text: '$_roll',
                          style: TextStyle(
                              
                              fontSize: 30.0,
                              color: Colors.white),
                        ),
                      ]),
                    ),
                    new NumberPicker.integer(
                      initialValue: _roll,
                      minValue: 1,
                      maxValue: 200,
                      onChanged: (newValue) {
                        setState(() {
                          _roll = newValue;

                          //this is where the global varable is being set
                          rollNo = newValue;
                        });
                      },
                    ),
                  ],
                ),
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
        child: Icon(
          Icons.arrow_forward,
          color: Color(0xFFF4B400),
        ),
      ),
    );
  }
}
