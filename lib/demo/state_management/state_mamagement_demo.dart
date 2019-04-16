import 'package:flutter/material.dart';

///带变化状态的小部件
class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

  ///从父辈哪里传递个回调
  void _increaseCount() {
    setState(() {
      _count = _count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
        ),
//      body: Center(
//        child: Chip(label: Text('${_count}')),
//      ),
        ///由父辈管理状态
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

///由父辈管理状态
class Counter extends StatelessWidget {
//  Counter(this.count);
//  Counter(this.count, this.increaseCount);
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount = CounterProvider.of(context).increaseCount;
    return ActionChip(
      label: Text('${count}'),
      onPressed: increaseCount,
    );
  }
}

///有效的传递数据给子部件
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;
  const CounterProvider({
    Key key,
    this.count,
    this.increaseCount,
    this.child,
  })  : assert(child != null),
        super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CounterProvider) as CounterProvider;
  }

  ///是否重建小部件
  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}
