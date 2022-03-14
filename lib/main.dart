import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey[900],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Color.fromRGBO(85, 174, 47, 1),
        ),
        home: Scaffold(
          appBar:
              PreferredSize(preferredSize: Size.fromHeight(0), child: AppBar()),
          body: new WebviewScaffold(
            url: "https://flutter.dev/", // replace with the url you want
            javascriptChannels: [
              JavascriptChannel(
                  name: 'Print',
                  onMessageReceived: (JavascriptMessage message) {
                    print(message.message);
                  }),
            ].toSet(),
            userAgent:
                "Mozilla/5.0 (Linux; Android 11) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Mobile Safari/537.36",
            clearCache: true,
            appCacheEnabled: false,
            withZoom: false,
            withLocalStorage: true,
            hidden: true,
            geolocationEnabled: true,
            withJavascript: true,
            scrollBar: false,
            initialChild: Container(
              color: Colors.white10,
              child: Center(
                child: Image.asset('assets/logo.png',
                    height: 150, width: 150, fit: BoxFit.cover),
              ),
            ),
          ),
        ));
  }
}
