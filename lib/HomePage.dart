import 'package:flutter/material.dart';
import 'package:chatapp/ChatScreen.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ChatApp"),
      ),
      body: new ChatScreen(),
    );
  }
}
