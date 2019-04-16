import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RxDartDemo'),
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;
  @override
  void initState() {
    super.initState();
//    Observable<String> _observable =
//    Observable(Stream.fromIterable(['hello', '你好']));
//    Observable.fromFuture(Future.value('hello'));
//    Observable.fromIterable(['hello', '你好']);
//        Observable.just('hello-just');
//        Observable.periodic(Duration(seconds: 3), (x) {
//      return x.toString();
//    });
//    _observable.listen(print);

    // 使用Subject控制Observable
//  PublishSubject<String> _publishSubjectDemo = PublishSubject<String>();
//    _publishSubjectDemo.listen((data){print('listen 1:$data');});
//    _publishSubjectDemo.add('hello');
//    _publishSubjectDemo.listen((data){print('listen 2:${data.toUpperCase()}');});
//    _publishSubjectDemo.add('hold');
//    _publishSubjectDemo.close();

//    BehaviorSubject<String> _behaviorSubjectDemo = BehaviorSubject<String>();
//    _behaviorSubjectDemo.listen((data) {
//      print('listen 1:$data');
//    });
//    _behaviorSubjectDemo.add('hello');
//    _behaviorSubjectDemo.listen((data) {
//      print('listen 2:${data.toUpperCase()}');
//    });
//    _behaviorSubjectDemo.add('hold');
//    _behaviorSubjectDemo.close();

//    ReplaySubject<String> _replaySubjectDemo = ReplaySubject<String>(maxSize: 2);
//    _replaySubjectDemo.add('hello');
//    _replaySubjectDemo.add('hold');
//    _replaySubjectDemo.add('hi');
//    _replaySubjectDemo.listen((data) {
//      print('listen 1:$data');
//    });
//    _replaySubjectDemo.listen((data) {
//      print('listen 2:${data.toUpperCase()}');
//    });
//    _replaySubjectDemo.close();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
        //RxDart的数据转换方法
//        .map((item) {
//      return 'Item:${item}';
//    })
        //RxDart的where方法
        .where((item) => item.length > 9)
        //RxDart的debounce方法
        .debounce(Duration(milliseconds: 500))
        //RxDart的数据监听方法
        .listen((data) {
      print('${data}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input:${value}');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit:${value}');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}
