import 'package:flutter/material.dart';
import 'rapid.dart';
import 'search.dart';
import 'profile.dart';
import 'appbar.dart';
import 'home.dart';
import 'package:yell_mvp/presentation/my_flutter_app_icons.dart';



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyNav();
  }
}

class MyNav extends StatefulWidget {
  @override
  _MyNavState createState() => _MyNavState();
}

class _MyNavState extends State<MyNav> with SingleTickerProviderStateMixin{
  TabController controller;
  MyAppBar appbar = MyAppBar();

  @override
  void initState(){
    super.initState();
    controller = new TabController(length: 4, vsync: this);
    controller.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
        if(controller.index == 2){
          appbar = null;
        }else{
          appbar = MyAppBar();
        }
    });
  }


  @override
  Widget build(BuildContext context) {
    final colorLightGrey = const Color(0xFF0B1449);

    return Scaffold(
      appBar: appbar,
      body: new TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          new Home(),
          new Rapid(),
          new SearchList(),
          new Profile()
        ],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
          color: colorLightGrey,
          child: new TabBar(
            //indicatorColor: Colors.transparent,
            indicatorColor: Color(0xFF1638EF),
            tabs: <Widget>[
              new Tab(
                icon:  new Icon(
                  MyFlutterApp.inbox,
                  size: 30,
                  color: controller.index == 0
                      ? Color(0xFF9CC2FD) //clicked
                      : Color(0xFF28366D),
                ),
              ),
              new Tab(
                icon:  new Icon(
                  MyFlutterApp.rapidfire,
                  size: 30,
                  color: controller.index == 1
                      ? Color(0xFF9CC2FD) //clicked
                      : Color(0xFF28366D),
                ),
              ),
              new Tab(
                icon:  new Icon(
                  MyFlutterApp.search,
                  size: 30,
                  color: controller.index == 2
                      ? Color(0xFF9CC2FD)
                      : Color(0xFF28366D),
                ),
              ),
              new Tab(
                icon:  new Icon(
                  MyFlutterApp.profile,
                  size: 30,
                  color: controller.index == 3
                      ? Color(0xFF9CC2FD)
                      : Color(0xFF28366D),
                ),
              )
            ],
            controller: controller,
          )
      ),
    );
  }
}