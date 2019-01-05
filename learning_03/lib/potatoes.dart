import 'package:flutter/material.dart';

class Potatoes extends StatelessWidget {
  final List<String> potatoesList;

  Potatoes(this.potatoesList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: potatoesList
          .map(
            (element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/potatoe.jpg'),
                      Text(element)
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}
