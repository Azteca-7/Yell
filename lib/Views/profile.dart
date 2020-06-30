import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF0A1035),
      body: new Container(
        child: new Center(
            child: Text('ProfileFire', style: new TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20),)
        ),
      ),
    );
  }
}