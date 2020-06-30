import 'package:flutter/material.dart';
import 'package:yell_mvp/Views/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Map<int, Color> color =
    {
      50:Color.fromRGBO(11, 20, 73, .1),
      100:Color.fromRGBO(11, 20, 73, .2),
      200:Color.fromRGBO(11, 20, 73, .3),
      300:Color.fromRGBO(11, 20, 73, .4),
      400:Color.fromRGBO(11, 20, 73, .5),
      500:Color.fromRGBO(11, 20, 73, .6),
      600:Color.fromRGBO(11, 20, 73, .7),
      700:Color.fromRGBO(11, 20, 73, .8),
      800:Color.fromRGBO(11, 20, 73, .9),
      900:Color.fromRGBO(11, 20, 73, 1),
    };

    return MaterialApp(
      title: 'Garage y Talleres',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF0B1449, color),
        backgroundColor: Color(0xFF0A1035)
      ),
      home: MyLogin(),
    );
  }
}