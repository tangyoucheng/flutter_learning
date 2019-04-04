import 'package:flutter/material.dart';

class BasicContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
//            color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.only(left: 24.0, right: 8.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                border: Border.all(
                    color: Colors.indigoAccent[100],
                    width: 10.0,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
          ),
          Container(
            child: Icon(Icons.person, size: 32.0, color: Colors.white),
            padding: EdgeInsets.all(24.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                //borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 16.0),
                    color: Colors.green,
                    blurRadius: 25.0,
                    spreadRadius: -9.0,
                  )
                ],
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                )),
          ),
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
            alignment: Alignment.topCenter,
//          repeat: ImageRepeat.repeatY,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.indigoAccent[100].withOpacity(0.2), BlendMode.hardLight)),
      ),
    );
  }
}
