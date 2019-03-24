
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
      routes: {
        "/": (_) => new WebviewScaffold(
          url: "https://attandance-app.herokuapp.com/",
          appBar: new AppBar(
            title: new Text("Widget webview"),
          ),
        ),
      },
    )
    );
}