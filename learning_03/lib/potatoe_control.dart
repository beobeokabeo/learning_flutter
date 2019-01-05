import 'package:flutter/material.dart';

class PotatoeControl extends StatelessWidget {
  final Function addPotatoe;
  PotatoeControl(this.addPotatoe);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text("Add stuff"),
      splashColor: Colors.green,
      onPressed: () {
        addPotatoe('potatoe');
      },
    );
  }
}
