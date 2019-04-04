import 'package:flutter/material.dart';

class HelloDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    @override
    Widget build(BuildContext context) {
      return Center(
        child: Text(
          'hello',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
          ),
        ),
      );
    }
  }
}
