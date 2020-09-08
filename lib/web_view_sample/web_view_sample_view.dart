import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

import './web_view_sample_view_model.dart';

class WebViewSampleView extends WebViewSampleViewModel {
  bool isLoading = true;

  String htmlText = """
     <div>
          <h1>Demo Page</h1>
          <p>This is a fantastic product that you should buy!</p>
          <h3>Features</h3>
          <ul>
            <li>It actually works</li>
            <li>It exists</li>
            <li>It doesn't cost much!</li>
          </ul>
          <!--You can pretty much put any html in here!-->
        </div>
  """;
  WebViewController controller;

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    // flutterWebviewPlugin.onUrlChanged

    // flutterWebviewPlugin.
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (isLoading) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () async {
          String script = 'document.title';
          var title = await controller.evaluateJavascript(script);
          print("$title");
        },
      ),
      body: Stack(
        children: [
          buildWebView(),
          Center(
              child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: isLoading ? 1 : 0,
                  child: CircularProgressIndicator())),
        ],
      ),
    );
  }

  WebviewScaffold buildWebviewScaffoldCommunity() {
    return WebviewScaffold(
      url: uri.toString(),
      appBar: AppBar(),
      initialChild: null,
      invalidUrlRegex: "a",
    );
  }

  Uri get uri => Uri.dataFromString(htmlText, mimeType: 'text/html');

  WebView buildWebView() {
    return WebView(
      initialUrl: "https://www.vbt.com.tr/",
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (url) {
        if (isLoading) {
          setState(() {
            isLoading = false;
          });
        }
      },
      onWebViewCreated: (controller) {
        this.controller = controller;
      },
      navigationDelegate: (navigation) {
        if (navigation.url.contains("vbt.com.tr")) {
          return NavigationDecision.navigate;
        }
        return NavigationDecision.prevent;
      },
    );
  }
}
