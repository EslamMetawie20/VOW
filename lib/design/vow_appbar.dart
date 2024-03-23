import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final List<Widget>? actions; // Add this line to receive actions

  MyAppBar({
    Key? key,
    required BuildContext context,
    this.actions,
  }) : super(
    key: key,
    elevation: 0,
    leading: Container(
      margin: EdgeInsets.all(13.0),
      child: CircleAvatar(
        backgroundImage: AssetImage('lib/design/photo.png'),
        backgroundColor: Colors.white,
      ),
    ),
    backgroundColor: Colors.pinkAccent,
    title: Text(
      "VOW",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 38,
      ),
    ),
    actions: actions, // Add this line to include actions
  );
}
