import 'package:flutter/material.dart';
import '../util/route_name_util.dart';

class NavigateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: null,
              child: Text('home'),
            ),
            FlatButton(
              onPressed: () {
//                Navigator.of(context).push(MaterialPageRoute(
//                    builder: (BuildContext context) => Page(title: 'about')));
                Navigator.pushNamed(context, RouteNameUtil.ABOUT);
              },
              child: Text('about'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  String title;
  Page({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}


