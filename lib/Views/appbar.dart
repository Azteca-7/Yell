import 'package:flutter/material.dart';
import 'package:yell_mvp/presentation/my_flutter_app_icons.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  var counter = "0";
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return new AppBar(
        title: new Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           // new Image.asset('img/font_logo.png', fit: BoxFit.cover, height: 50,),
            new Text("YELL"),
    /*
            new IconButton(
              icon: Icon(MyFlutterApp.notification, size: 28.0, color: Color(0xFF9CC2FD) ,),
              tooltip: 'Proximamente',
              onPressed: () {},
            ),*/
            new Stack(
              children: <Widget>[
                new IconButton(
            icon: Icon(MyFlutterApp.notification, size: 28.0, color: Color(0xFF9CC2FD) ,),
                    onPressed: () {
                      setState(() {

                        try{
                          n = int.parse(counter);
                        }catch(ex){
                          n = 100;
                          print(ex);
                        }

                        if(n > 98){
                          counter = "99+";
                        }else{
                          n = n+1;
                          counter = n.toString();
                        }

                      });
                }),
                n != 0 ? new Positioned(
                  right: 3,
                  top: 9,
                  child: new Container(
                    padding: EdgeInsets.all(2),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '$counter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ) : new Container()
              ],
            ),
            /*PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Ajustes"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Log Out"),
                ),

              ],
              //initialValue: 2,
              onCanceled: () {
                print("You have canceled the menu.");
              },
              onSelected: (value) {
                print("value:$value");
              },
              icon: Icon(Icons.account_circle, size: 32.0,),
              offset: Offset(0, 200),
            )*/

          ],
        )
    );
  }
}
