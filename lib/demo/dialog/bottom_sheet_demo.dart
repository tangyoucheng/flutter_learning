import 'package:flutter/material.dart';
import 'dart:async';

///底部滑动窗口
class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Text('01:3 / 03:30'),
              Icon(Icons.pause_circle_outline),
              SizedBox(width: 16.0),
              Expanded(child: Text('Fix you - Goldplay', textAlign: TextAlign.right)),
            ],
          ),
        ),
      );
    });
  }

  String _choiceModal = 'Nothing';
  Future _openModelBottomSheet() async {
    final optionModal = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Opting A'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('Opting B'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('Opting C'),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                ),
              ],
            ),
          );
        });

    setState(() {
      _choiceModal = optionModal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: new AppBar(
        title: new Text('BottomSheetDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: _openBottomSheet,
                  child: Text('Open BottomSheet'),
                ),
                FlatButton(
                  onPressed: _openModelBottomSheet,
                  child: Text('Open ModelBottomSheet'),
                ),
              ],
            ),
            Text('Your choice is ${_choiceModal}'),
          ],
        ),
      ),
    );
  }
}
