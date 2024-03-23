import 'package:flutter/material.dart';
import 'WelcomePage.dart';
void main() {
  runApp(Hall());
}

class Hall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     // home: Browsing(),
      home: WelcomePage(),
    //home: chat_user(),
    );
  }
}
