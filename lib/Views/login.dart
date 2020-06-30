import 'package:flutter/material.dart';
//import 'dart:async';
import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'tabview.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'signup.dart';

//SharedPreferences prefs;

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Widget LoginBtnTxt = Text ("Login",
    style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.white),
  );

  var txtUser = new TextEditingController();
  var txtPass = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF0A1035),
      body: new Container(
       color: Color(0xFF0A1035),
        /*padding: EdgeInsets.all(30.0),*/

          child: new SingleChildScrollView(

            child: new Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 45, left: 30, right: 30),
                  color: Color(0xFF0A1035),
                  width: double.infinity,
                  height: 350,
                  child: Column(

                    children: <Widget>[

                      new Container(padding: EdgeInsets.only(top: 50),),
                      new Text("Y E L L", style: TextStyle(fontSize: 30, color:Colors.white, fontWeight: FontWeight.w200),),
                      new Container(padding: EdgeInsets.only(top: 10, bottom: 10),),
                      new Image.asset('img/logo-yell.png', fit: BoxFit.fill, height: 130, width: 130,),



                    ],
                  ),
                ),

                new Container(
                  padding: EdgeInsets.only(top: 0, left: 30, right: 30),
                  color: Color(0xFF0A1035),

                  child: Column(

                    children: <Widget>[

                      new TextField(
                          controller: txtUser,
                          style: new TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelStyle: new TextStyle(
                                color: Colors.white
                            ),
                            //hintText: 'Entre calles, cerca de, etc',
                            //icon: Icon(Icons.search),
                            labelText: 'Mail',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF1638EF), width: 1.0),
                              ),
                            border: new OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFF1638EF), width: 1.0),
                            ),
                              //focusedBorder: ...
                              //border: ...

                          )
                      ),

                      new Container(padding: EdgeInsets.only(bottom: 10, top:10),),

                      new TextField(
                        controller: txtPass,
                        style: new TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelStyle: new TextStyle(
                              color: Colors.white
                          ),
                          //hintText: 'Entre calles, cerca de, etc',
                          //icon: Icon(Icons.search),
                          labelText: 'Contraseña',
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF1638EF), width: 2.0),
                          ),
                          border: new OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF1638EF), width: 1.0),
                          ),

                        ),
                        obscureText: true,
                      ),

                    new Container(padding: EdgeInsets.only(top: 30),),

                      new SizedBox(
                          width: double.infinity, // match_parent
                          child: RaisedButton(
                            child: LoginBtnTxt,
                            color: Color(0xFF1638EF),
                            padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 60, right: 60),

                            onPressed: () async {

                              setState(() {

                                LoginBtnTxt = SizedBox(
                                  child: CircularProgressIndicator(),
                                  height: 10.0,
                                  width: 10.0,
                                );

                                LoginBtnTxt = SizedBox(
                                  child: CircularProgressIndicator(
                                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                  height: 25,
                                  width: 25,
                                );
                              });

                              Navigator.pushReplacement(context,
                                  new MaterialPageRoute(builder: (context) => new MyApp())
                              );

                              /* verifyUser(txtUser.text, txtPass.text).then((value) async{

                            if(value != null && value.length > 25){

                              var user = jsonDecode(value);

                              List<String> userPref = new List<String>();
                              userPref.add(user[0]['oid'].toString());
                              userPref.add(user[0]['nombre'].toString());

                              prefs = await SharedPreferences.getInstance();
                              await prefs.setStringList('user', userPref);
                              userPref =  prefs.getStringList('user');

                              Navigator.pushReplacement(context,
                                  new MaterialPageRoute(builder: (context) => new MyApp())
                              );


                            }else{

                              setState(() {
                                LoginBtnTxt = Text ("Login",
                                  style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: Colors.white),
                                );
                              });

                              print("Contraseña o usuario incorrecto");

                              _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text('Usuario o contraseña incorrectos', style: TextStyle(fontSize: 18.0),),
                                    duration: Duration(seconds: 8),
                                  ));

                            }



                          });*/

                            },
                          )
                      )



                    ],
                  ),
                )


              ],
            ),

          )
      ),



    );
  }

/*  Future <String> verifyUser(String user, String pass) async{

    String url = "http://dev.outputcc.com/wsgruas/api/Login";
    var response = await http.post(
        Uri.encodeFull(url),
        body: {
          'email': user,
          'contrasenia' : pass
        }
    );

    //print(response.body);
    return response.body;
  }*/

}
