import 'package:flutter/material.dart';
import 'demo/drawer_demo.dart';
import 'demo/drawer_user_demo.dart';
import 'demo/drawer_container_demo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/list_view_demo.dart';
import 'demo/basic_text_demo.dart';
import 'demo/basic_container_demo.dart';
import 'demo/layout_demo.dart';
import 'demo/view_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/navigate_demo.dart';
import 'util/route_name_util.dart';
import 'demo/form_demo.dart';
import 'demo/material_components.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      home: HomeTab(),
//      home: SliverDemo(),
//      home: NavigateDemo(),
      initialRoute: RouteNameUtil.MATERIAL_DESIGN_COMPONENTS,
      routes: {
        RouteNameUtil.INDEX: (context) => NavigateDemo(),
        RouteNameUtil.ABOUT: (context) => Page(title: 'about'),
        RouteNameUtil.FROM: (context) => FormDemo(),
        RouteNameUtil.MATERIAL_DESIGN_COMPONENTS: (context) => MaterialComponents(),
      },
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Color.fromRGBO(3, 54, 255, 1.0),
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigationg',
          onPressed: () => debugPrint('Navigationg button is pressed.'),
        ),
        title: Text('ninghao'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => debugPrint('Search button is pressed.'),
          ),
        ],
        elevation: 4.0,
      ),
      //body: ListViewDemo(),
      body: null,
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text('ninghao'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('Search button is pressed.'),
            ),
          ],
          elevation: 4.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.local_florist),
              ),
              Tab(
                icon: Icon(Icons.change_history),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                icon: Icon(Icons.view_quilt),
              ),
            ],
          ),
        ),
        //body: ListViewDemo(),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
//            Icon(
//              Icons.local_florist,
//              size: 128.0,
//              color: Colors.black12,
//            ),
//            BasicDemo(),
            BasicContainerDemo(),
//            Icon(
//              Icons.change_history,
//              size: 128.0,
//              color: Colors.black12,
//            ),
            LayoutDemo(),
//            Icon(
//              Icons.directions_bike,
//              size: 128.0,
//              color: Colors.black12,
//            ),
            ViewDemo(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarDemo(),
//    floatingActionButton: FloatingActionButton.extended(
//          onPressed: () => debugPrint('floatingActionButton'),
//          tooltip: 'Increment Counter',
//          icon: Icon(Icons.add),
//      label: Text('Increment'),
//        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => debugPrint('floatingActionButton'),
          tooltip: 'Increment Counter',
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        //drawer: DrawerContainerDemo(),
//        drawer: DrawerDemo(),
        drawer: DrawerUserDemo(),
      ),
    );
  }
}
