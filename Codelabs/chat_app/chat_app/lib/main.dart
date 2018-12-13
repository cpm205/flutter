// Replace the code in main.dart with the following.

/*To specify the default screen that users see in your app,
set the home argument in your MaterialApp definition.
The home argument references a widget that defines the main UI for this app.
The widget consists of a Scaffold widget that has a simple AppBar as its child widget.
 */
import 'package:flutter/material.dart';

void main() {
  runApp(new FriendlychatApp());
}

/*
You describe the part of the user interface represented by a widget in its build method.
The framework calls the build() methods for FriendlychatApp or ChatScreen when inserting these widgets
into the widget hierarchy and when their dependencies change.
@override is a Dart annotation that indicates that the tagged method overrides a superclass's method.
Some widgets, like Scaffold and AppBar, are specific to Material Design apps.
Other widgets, like Text, are generic and can be used in any app.
Widgets from different libraries in the Flutter framework are compatible and can work together in a single app.
* */

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      home: new ChatScreen(),
    );
  }
}
/*
State is information that can be read synchronously when the widget is built and that might change during the lifetime of the widget.
In Flutter, if you want to visually present stateful data in a widget, you should encapsulate this data in a State object.
You can then associate your State object with a widget that extends the StatefulWidget class.
* */
// Modify the ChatScreen class definition to extend StatefulWidget.
class ChatScreen extends StatefulWidget {                     //modified
  @override                                                        //new
  State createState() => new ChatScreenState();                    //new
}

// Add the ChatScreenState class definition in main.dart.
class ChatScreenState extends State<ChatScreen> {                  //new
  @override                                                        //new
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendly chat")),

    );
  }
}