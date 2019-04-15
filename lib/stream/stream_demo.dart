import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('StreamDemo'),
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamControllerDemo;
  StreamSink _streamSinkDemo;
  String _data = '...';

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
//    throw 'Someting happened';
    return 'hello';
  }

  void onData(String data) {
    setState(() {
      _data = data;
    });
    print('$data');
  }

  void onDataTwo(String data) {
    print('onDataTwo:$data');
  }

  void onError(error) {
    print('$error');
  }

  void onDone() {
    print('Done');
  }

  ///添加
  void _addDataToStream() async {
    print('Add data to stream.');
    String data = await fetchData();
//    _streamControllerDemo.add(data);
    _streamSinkDemo.add(data);
  }

  ///暂停
  void _pauseStream() {
    print('Pause Subscription.');
    _streamDemoSubscription.pause();
  }

  ///恢复
  void _resumeStream() {
    print('Resum Subscription.');
    _streamDemoSubscription.resume();
  }

  ///取消
  void _cancelStream() {
    print('Cancel Subscription.');
    _streamDemoSubscription.cancel();
  }

  @override
  void initState() {
    super.initState();
    print('create a stream.');

    ///Stream创建
//    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
//    _streamControllerDemo = StreamController<String>();
    _streamControllerDemo = StreamController.broadcast();
    _streamSinkDemo = _streamControllerDemo.sink;
    print('Start lintening on  a stream.');

    ///Stream监听
//    _streamDemo.listen(onData, onError: onError, onDone: onDone);
    _streamDemoSubscription =
        _streamControllerDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamControllerDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
    print('Initialize completed.');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          Text('$_data')
          StreamBuilder(
            stream: _streamControllerDemo.stream,
            initialData: '...',
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(onPressed: _addDataToStream, child: Text('Add')),
              FlatButton(onPressed: _pauseStream, child: Text('Pause')),
              FlatButton(onPressed: _resumeStream, child: Text('Resume')),
              FlatButton(onPressed: _cancelStream, child: Text('Cancel')),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _streamControllerDemo.close();
    super.dispose();
  }
}
