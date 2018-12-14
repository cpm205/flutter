// Replace the code in main.dart with the following.

/*To specify the default screen that users see in your app,
set the home argument in your MaterialApp definition.
The home argument references a widget that defines the main UI for this app.
The widget consists of a Scaffold widget that has a simple AppBar as its child widget.
 */
import 'package:flutter/material.dart';

const String _name = "DKH";
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
Widgets like Scaffold and AppBar, are specific to Material Design apps.
* */
// Modify the ChatScreen class definition to extend StatefulWidget.
class ChatScreen extends StatefulWidget {                     //modified
  @override                                                        //new
  State createState() => new ChatScreenState();                    //new
}

// Add the ChatScreenState class definition in main.dart.
//To manage interactions with the text field, it's helpful to use a TextEditingController object.
//You'll use it for reading the contents of the input field,
//and for clearing the field after the text message is sent.
//A BuildContext object is a handle to the location of a widget in your app's widget tree.
//Each widget has its own BuildContext, which becomes the parent of the widget returned by the StatelessWidget.build or State.build function.
//This means the _buildTextComposer() method can access the BuildContext object from its encapsulating State object;
//you don't need to pass the context to the method explicitly.
class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();
  @override                                                        //new
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendly chat")),
      //The _buildTextComposer method returns a widget that encapsulates the text input field.
      body: _buildTextComposer(), //new
    );
  }

  // Add the following code in the ChatScreenState class definition.
  //The following code snippet shows how you can define a private method called _buildTextComposer()
  //that returns a Container widget with a configured TextField widget.
  //Please bear in mind Container and Padding can only contain on child widget.
  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      //Since we want to display the button adjacent to the input field, we'll use a Row widget as the parent
      child: new Row(                                            //new
        children: <Widget>[
          //Then wrap the TextField widget in a Flexible widget.
          //This tells the Row to automatically size the text field to use the remaining space that isn't used by the button.
          new Flexible(                                          //new
            child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: new InputDecoration.collapsed(
                  hintText: "Send a message"),
            ),
          ),

          //Put your IconButton widget inside another Container parent widget;
          //this lets you customize the margin spacing of the button so that it visually fits better next to your input field.
          new Container(                                                 //new
            margin: new EdgeInsets.symmetric(horizontal: 4.0),           //new
            child: new IconButton(                                       //new
                icon: new Icon(Icons.send),                                //new
                color: Colors.blue,
                onPressed: () => _handleSubmitted(_textController.text)),  //new
          ),
        ],                                                        //new
      ),                                                          //new
    );
  }

  //use the onSubmitted argument to provide a private callback method _handleSubmitted()
  //Tip: Prefixing an identifier with an _ (underscore) makes it private to its class
  void _handleSubmitted(String text) {
    _textController.clear();
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(_name[0])),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

