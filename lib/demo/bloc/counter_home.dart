import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ninghao/common/bloc/bloc_base.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
        child: StreamBuilder(
            initialData: 0,
            stream: _counterBloc.conut,
            builder: (context, snapshot) {
              return ActionChip(
                  label: Text('${snapshot.data}'),
                  onPressed: () {
//            _counterBloc.log();
                    _counterBloc.counter.add(1);
                  });
            }));
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
//          _counterBloc.log();

          _counterBloc.counter.add(1);
        });
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;
  const CounterProvider({
    Key key,
    this.child,
    this.bloc,
  })  : assert(child != null),
        super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CounterProvider) as CounterProvider;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

//用sink输入数据、Stream输出数据
class CounterBloc implements BlocBase{
  int _count = 0;
  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();
  Stream<int> get conut => _counterController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }
  void onData(int data) {
    print('$data');
    _count = data + _count;
    _counterController.add(_count);
  }

  @override
  void dispose() {
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('BLoc');
  }
}
