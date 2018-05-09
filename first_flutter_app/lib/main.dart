import 'package:flutter/material.dart';

void main(){
  runApp(
    new Material(
      color: Colors.deepOrange,
      child: new Center(
         child:new Text(
           "hello there",
           textDirection: TextDirection.ltr,
           style: new TextStyle(fontWeight: FontWeight.w800, fontStyle: FontStyle.italic),
         )
       ),
    )
  );
}