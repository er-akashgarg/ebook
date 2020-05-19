import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikipediaExplorer extends StatefulWidget {
  String url = "";

  WikipediaExplorer(this.url);

  @override
  _WikipediaExplorerState createState() => _WikipediaExplorerState(url);
}

class _WikipediaExplorerState extends State<WikipediaExplorer> {
  String url = "";
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();

  _WikipediaExplorerState(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Book Reader'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
//          NavigationControls(_controller.future),
//          Menu(_controller.future, () => _favorites),
        ],
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
