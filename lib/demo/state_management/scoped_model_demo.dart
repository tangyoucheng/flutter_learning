import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

///ScopeModel传递参数
class ScopedModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
        ),
//      body: Center(
//        child: Chip(label: Text('${_count}')),
//      ),
        ///由父辈管理状态
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context, _, model) {
              return FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: model.increaseCount,
              );
            }),
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
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) {
        return ActionChip(
          label: Text('${model.count}'),
          onPressed: model.increaseCount,
        );
      },
    );
  }
}

///ScopeModel传递参数
class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increaseCount() {
    _count += 1;

    ///重建小部件
    notifyListeners();
  }
}
