import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavigationBarDemoState();
  }
}

class BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  void _onTabHandler(int _index) {
    setState(() {
      _currentIndex = _index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
//        fixedColor: Colors.black,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.explore), title: Text('Explore')),
        BottomNavigationBarItem(
            icon: Icon(Icons.history), title: Text('History')),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('List')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('My')),
      ],
      currentIndex: _currentIndex,
      onTap: _onTabHandler,
    );
  }
}
