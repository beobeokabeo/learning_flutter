import "package:flutter/material.dart";

import './potatoe_manager.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Column(children: [
              Container(
                child: Text("Title here"),
                color: Colors.green,
              )
            ]),
            backgroundColor: Colors.black),
        body: PotatoeManager(),
        backgroundColor: Colors.black,
      ),
    );
  }
}
