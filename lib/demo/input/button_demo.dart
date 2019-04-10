import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///文字按钮
    final Widget _flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text('Button'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Button'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    ///按钮
    final Widget _raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
//              shape: BeveledRectangleBorder(
//                borderRadius: BorderRadius.circular(5.0),
//              ),
                shape: StadiumBorder(),
              )),
          child: RaisedButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey,
            color: Theme.of(context).accentColor,
//          textColor: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            elevation: 0.0,
          ),
        ),
        RaisedButton(
          onPressed: () {},
          child: Text('Button'),
          splashColor: Colors.grey,
          color: Theme.of(context).accentColor,
//          textColor: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
          elevation: 0.0,
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Button'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          elevation: 12.0,
        ),
      ],
    );

    ///描边按钮
    final Widget _outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
//              shape: BeveledRectangleBorder(
//                borderRadius: BorderRadius.circular(5.0),
//              ),
                shape: StadiumBorder(),
              )),
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
//            color: Theme.of(context).accentColor,
            textColor: Theme.of(context).accentColor,
            highlightedBorderColor: Colors.grey,
            textTheme: ButtonTextTheme.primary,
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        OutlineButton(
          onPressed: () {},
          child: Text('Button'),
          splashColor: Colors.grey,
          color: Theme.of(context).accentColor,
//          textColor: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Button'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    ///有固定宽度的按钮
    final Widget _fixedWidthButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          onPressed: () {},
          child: Text('Button'),
          splashColor: Colors.grey,
          color: Theme.of(context).accentColor,
//          textColor: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ],
    );

    ///占满可用宽度的按钮
    final Widget _expandedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey,
            color: Theme.of(context).accentColor,
//          textColor: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey,
            color: Theme.of(context).accentColor,
//          textColor: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      ],
    );

    ///一组带边框的横排显示的按钮
    final Widget _buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
            data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
              ),
            ),
            child: ButtonBar(
              children: <Widget>[
                OutlineButton(
                  onPressed: () {},
                  child: Text('Button'),
                  splashColor: Colors.grey,
                  color: Theme.of(context).accentColor,
//          textColor: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                ),
                OutlineButton(
                  onPressed: () {},
                  child: Text('Button'),
                  splashColor: Colors.grey,
                  color: Theme.of(context).accentColor,
//          textColor: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                ),
              ],
            ))
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ButtonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _flatButtonDemo,
            _raisedButtonDemo,
            _outlineButtonDemo,
            Container(
              width: 138.0,
              child: _fixedWidthButtonDemo,
            ),
            _expandedButtonDemo,
            _buttonBarDemo,
          ],
        ),
      ),
    );
  }
}
