import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return PageViewDemo();
//    return PageViewBuildDemo();
//    return GridViewCountDemo();
//    return GridViewExtendDemo();
    return GridViewBuildDemo();
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
//      pageSnapping: false,
//      reverse: true,
//      scrollDirection: Axis.vertical,
      onPageChanged: (currentPage) => debugPrint('$currentPage'),
      controller: PageController(
          initialPage: 1,
//        keepPage: false,
          viewportFraction: 0.85),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment.center,
          child: Text(
            'ONE',
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.brown[900],
          alignment: Alignment.center,
          child: Text(
            'Two',
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.brown[900],
          alignment: Alignment.center,
          child: Text(
            'THREE',
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
      ],
    );
  }
}

class PageViewBuildDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].author,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTitle(int length) {
    return List.generate(length, (int index) {
      return Container(
        alignment: Alignment.center,
        color: Colors.grey[300],
        child: Text(
          'Item${index}',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
//      scrollDirection: Axis.vertical,
      mainAxisSpacing: 16.0,
//      children: <Widget>[
//        Container(
//          alignment: Alignment.center,
//          color: Colors.grey[300],
//          child: Text(
//            'Item',
//            style: TextStyle(fontSize: 18.0, color: Colors.grey),
//          ),
//        ),
//      ],
      children: _buildTitle(100),
    );
  }
}

class GridViewExtendDemo extends StatelessWidget {
  List<Widget> _buildTitle(int length) {
    return List.generate(length, (int index) {
      return Container(
        alignment: Alignment.center,
        color: Colors.grey[300],
        child: Text(
          'Item$index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      maxCrossAxisExtent: 150.0,
      crossAxisSpacing: 16.0,
//      scrollDirection: Axis.vertical,
      mainAxisSpacing: 16.0,
//      children: <Widget>[
//        Container(
//          alignment: Alignment.center,
//          color: Colors.grey[300],
//          child: Text(
//            'Item',
//            style: TextStyle(fontSize: 18.0, color: Colors.grey),
//          ),
//        ),
//      ],
      children: _buildTitle(100),
    );
  }
}

class GridViewBuildDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 3,
//        crossAxisSpacing: 8.0,
//        mainAxisSpacing: 8.0,
//      ),
    );
  }
}
