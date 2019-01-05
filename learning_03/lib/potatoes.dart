import 'package:flutter/material.dart';

class Potatoes extends StatelessWidget {
  final List<String> potatoesList;

  Potatoes([this.potatoesList = const []]) {
    // stateless widget gets rebuilt every time
    print('[Potatoes] constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('[Potatoes] build');
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: potatoesList
              .map(
                (element) => Card(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/potatoe.jpg',
                            fit: BoxFit.fitWidth,
                            colorBlendMode: BlendMode.dstATop,
                          ),
                          Text(element)
                        ],
                      ),
                    ),
              )
              .toList(),
        ),
      ),
    );
  }
}
