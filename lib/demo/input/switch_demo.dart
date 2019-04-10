import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('_WidgetDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              value: _switchItemA,
              onChanged: (value) {
                setState(() {
                  _switchItemA = value;
                });
              },
              title: Text('SwitchItemA'),
              subtitle: Text('description'),
              secondary: Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
              selected: _switchItemA,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_switchItemA ? '😁' : '😭', style: TextStyle(fontSize: 32.0)),
                Switch(
                    value: _switchItemA,
                    onChanged: (value) {
                      setState(() {
                        _switchItemA = value;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
