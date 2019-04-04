import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

//        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBoxDemo(Icons.ac_unit),
          IconBadge(
            Icons.pool,
          ),
          IconBadge(
            Icons.beach_access,
            size: 64.0,
          ),
          IconBadge(
            Icons.airplanemode_active,
          ),
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData _icon;
  final double size;

  IconBadge(this._icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(
        _icon,
        size: size,
        color: Colors.white,
      ),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}

class SizedBoxDemo extends StatelessWidget {
  final IconData _icon;
  final double size;

  SizedBoxDemo(this._icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Color.fromRGBO(3, 54, 255, 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(_icon, color: Colors.white, size: size,),
      ),
    );
  }
}
