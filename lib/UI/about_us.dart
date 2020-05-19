import 'package:flutter/material.dart';

//import 'DrawerItem.dart';

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() {
    return new FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return new Scaffold(
//
//    )

    return new Center(
        child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
          "widget.drawerItem.title",
          style: new TextStyle(fontSize: 48.0, fontWeight: FontWeight.w300),
        ),
      ],
    ));
  }
}
