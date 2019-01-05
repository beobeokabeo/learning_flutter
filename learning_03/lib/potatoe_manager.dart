import 'package:flutter/material.dart';

import './potatoes.dart';

class PotatoeManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PotatoeManagerState();
  }
}

class _PotatoeManagerState extends State<PotatoeManager> {
  List<String> _potatoesList = ['potatoe'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5.0),
          child: RaisedButton(
            child: Text("Add stuff"),
            splashColor: Colors.green,
            onPressed: () {
              setState(() {
                _potatoesList.add('potatoe');
              });
            },
          ),
        ),
        Potatoes(_potatoesList),
      ],
    );
  }
}
