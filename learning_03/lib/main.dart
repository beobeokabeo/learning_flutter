import "package:flutter/material.dart";

import './potatoe_manager.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          brightness: Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          title: Column(children: [
            Container(
              child: Text("learning_03"),
            )
          ]),
           //backgroundColor: Colors.black,
        ),
        body: PotatoeManager(),
        // backgroundColor: Colors.transparent,
      ),
    );
  }
}
