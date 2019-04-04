import 'package:flutter/material.dart';

class DrawerContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var container = Container(
      color: Colors.white,
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('This is a Drawer.'),
        ],
      ),
    );
    return container;
  }
}
