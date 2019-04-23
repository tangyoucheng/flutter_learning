import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String url = 'https://www.baidu.com';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weview',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Webview'),
      routes: {
        "/webview": (_) => WebviewScaffold(
              url: url,
              appBar: AppBar(
                title: Text("打开的网页"),
              ),
              withJavascript: true, //允许执行js代码
              withLocalStorage: true, //允许LocalStorage
              withZoom: true, //允许网页缩放
              initialChild: Container(
                color: Colors.redAccent,
                child: const Center(
                  child: Text('Waiting.....'),
                ),
              ),
            )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  NewWeb createState() => NewWeb();
}

class NewWeb extends State<MyHomePage> {
  final webviewPlugin = FlutterWebviewPlugin();

  TextEditingController controller = TextEditingController(text: url);

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("首页Webview"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: controller,
              ),
            ),
            RaisedButton(
              //按钮点击事件
              child: Text("Open Webview"),
              onPressed: () {
                Navigator.of(context).pushNamed("/webview");
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    webviewPlugin.close();
    controller.addListener(() {
      url = controller.text;
    });
  }

  @override
  void dispose() {
// TODO: implement dispose
    webviewPlugin.dispose();
    controller.dispose();
    super.dispose();
  }
}
