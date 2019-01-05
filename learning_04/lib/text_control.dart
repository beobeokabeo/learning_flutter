import 'package:flutter/material.dart';

import './text_output.dart';

class TextControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {
  String _theText = 'Body';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
            child: Text('change txt'),
            onPressed: () {
              setState(() {
                _theText = 'The text changed';
              });
            }),
        TextOutput(_theText);
      ],
    );
  }
}
