// import 'dart:async'; // stream subscriptions

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String url = 'https://google.com';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'learning_05 WebView',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrangeAccent),
      routes: {
        '/': (_) => const HomePage(title: 'HomePage'),
        '/widget': (_) => new WebviewScaffold(
              url: url,
              appBar: new AppBar(
                title: const Text('Widget webview'),
              ),
              withZoom: true,
              withLocalStorage: true,
            )
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String userAgent =  'test';
   // 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

  // 'Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19';

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  // StreamSubscription _onDestroy;
  // StreamSubscription<String> _onUrlChanged;
  // StreamSubscription<WebViewStateChanged> _onStateChanged;
  // StreamSubscription<WebViewHttpError> _onHttpError;
  // StreamSubscription<double> _onScrollYChanged;
  // StreamSubscription<double> _onScrollXChanged;

  final _urlTextFieldController = new TextEditingController(text: url);
  final _scaffoldStateKey = new GlobalKey<ScaffoldState>();
  final _history = ["History:"];

  @override

  /// Add listeners and bind them to streams
  void initState() {
    super.initState();

    flutterWebviewPlugin.close();

    _urlTextFieldController.addListener(() {
      url = _urlTextFieldController.text;
    });

    // _onDestroy = flutterWebviewPlugin.onDestroy.listen((_) {
    //   if (mounted) {
    //     _scaffoldStateKey.currentState.showSnackBar(
    //         const SnackBar(content: const Text('Webview Destroyed')));
    //   }
    // });

    // _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
    //   if (mounted) {
    //     setState(() {
    //       _history.add('url changed: $url');
    //     });
    //   }
    // });

    // _onScrollXChanged =
    //     flutterWebviewPlugin.onScrollXChanged.listen((double x) {
    //   if (mounted) {
    //     setState(() {
    //       _history.add("X axis scroll: $x");
    //     });
    //   }
    // });

    // _onScrollYChanged =
    //     flutterWebviewPlugin.onScrollYChanged.listen((double y) {
    //   if (mounted) {
    //     setState(() {
    //       _history.add("Y-axis scroll: $y");
    //     });
    //   }
    // });

    // _onStateChanged =
    //     flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
    //   if (mounted) {
    //     setState(() {
    //       _history.add('onStateChanged: ${state.type} ${state.url}');
    //     });
    //   }
    // });

    // _onHttpError =
    //     flutterWebviewPlugin.onHttpError.listen((WebViewHttpError error) {
    //   if (mounted) {
    //     setState(() {
    //       _history.add('http error: ${error.code} ${error.url}');
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldStateKey,
      appBar: new AppBar(
        title: const Text('Learning Webview'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            padding: const EdgeInsets.all(24.0),
            child: new TextField(controller: _urlTextFieldController),
          ),
          new RaisedButton(
            onPressed: () {
              flutterWebviewPlugin.launch(
                url,
                rect: new Rect.fromLTWH(
                    0.0, 0.0, MediaQuery.of(context).size.width, 400.0),
              );
            },
            child: const Text('Embedded webview'),
          ),
          new RaisedButton(
            onPressed: () {
              flutterWebviewPlugin.launch(url);
            },
            child: const Text('Fullscreen webview'),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/widget');
            },
            child: const Text('Widget webview (route)'),
          ),
          new RaisedButton(
            onPressed: () {
              setState(() {
                _history.clear();
              });
              flutterWebviewPlugin.close();
            },
            child: const Text('Close webview(s) & clean history'),
          ),
          new Text(_history.join('\n'))
        ],
      ),
    );
  }
}
