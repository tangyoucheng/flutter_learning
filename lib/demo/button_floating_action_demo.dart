import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  Widget _floatingActionButton = FloatingActionButton(
    onPressed: null,
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black87,
//    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  );

  Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: null,
    icon: Icon(Icons.add),
    label: Text('add'),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('FloatingActionButtonDemo'),
      ),
      floatingActionButton: _floatingActionButton,
//      floatingActionButton: _floatingActionButtonExtended,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}