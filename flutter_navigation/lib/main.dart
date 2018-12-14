import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyAppHome(), // becomes the route named '/'
    routes: <String, WidgetBuilder> {
      '/a': (BuildContext context) => new MyPage(title: 'page A'),
      '/b': (BuildContext context) => new MyPage(title: 'page B'),
      '/c': (BuildContext context) => new MyPage(title: 'page C'),
    },
  ));
}


//Navigate to a route by pushing its name to the Navigator.
//Navigator.of(context).pushNamed('/b');

//For example, to start a location route that lets the user select their location, you might do the following:
//Map coordinates = await Navigator.of(context).pushNamed('/location');

//And then, inside your ‘location’ route, once the user has selected their location, pop() the stack with the result:
//Navigator.of(context).pop({"lat":43.821757,"long":-79.226392});