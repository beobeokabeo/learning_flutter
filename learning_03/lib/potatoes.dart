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
    return Column(
      children: potatoesList
          .map(
            (element) => Card(
                  child: Column(
                    children: <Widget>[
                      new Card(
                        child: new Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: new ColorFilter.mode(
                                  Colors.white.withOpacity(1),
                                  BlendMode.dstATop),
                              image: new NetworkImage(
                                'http://www.allwhitebackground.com/images/2/2582-190x190.jpg',
                              ),
                            ),
                          ),
                        ),
                      ),
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
    );
  }
}
