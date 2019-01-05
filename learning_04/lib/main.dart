import "package:flutter/material.dart";

import './text_control.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrangeAccent),
      home: Scaffold(
          appBar: AppBar(
            title: Text('learning_04'),
          ),
          body: TextControl()),
    );
  }
}
