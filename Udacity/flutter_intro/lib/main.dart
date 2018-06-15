import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hell0"),
        ),
        body: HelloRec(),
      ),
    ),
  );
}

class HelloRec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: Container(
        color: Colors.greenAccent,
        height: 400.0,
        width: 300.0,
        child: Text("Hello", style: TextStyle(fontSize: 40.0)),
      ),
    );
  }
}
