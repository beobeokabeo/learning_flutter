import 'package:flutter/material.dart';

import './potatoes.dart';
import './potatoe_control.dart';

class PotatoeManager extends StatefulWidget {
  final String startingPotatoe;

  PotatoeManager({this.startingPotatoe = 'potatoe'}) {
    print('[Potatoe Manager] constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[Potatoe Manager] createState');
    return _PotatoeManagerState();
  }
}

class _PotatoeManagerState extends State<PotatoeManager> {
  final List<String> _potatoesList = [];

  @override
  void initState() {
    print('[Potatoe Manager] initState');
    _potatoesList.add(widget
        .startingPotatoe); // widget.property provided by the state that gives you access to connected state
    super.initState();
  }

  @override
  void didUpdateWidget(PotatoeManager oldWidget) {
    print('[Potatoe Manager] didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  void _addPotatoe(String potatoe) {
    setState(() {
      print('[Potatoe Manager] setState');
      _potatoesList.add('potatoe');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[Potatoe Manager] build');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: PotatoeControl(_addPotatoe),
        ),
        Potatoes(_potatoesList),
      ],
    );
  }
}
