import 'package:flutter/material.dart';
import 'package:yell_mvp/presentation/my_flutter_app_icons.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FeedModel
{
  String id;
  String urlAvatar;
  String name;
  String desc;
  Widget icon;

  FeedModel(this.id, this.urlAvatar , this.name, this.desc, this.icon);
}

class NewsModel
{
  String id;
  String urlAvatar;
  String name;
  String desc;
  Widget icon;

  NewsModel(this.id, this.urlAvatar , this.name, this.desc, this.icon);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF0A1035),
      body: FeedList(),
    );
  }
}

class FeedList extends StatefulWidget {
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  void initState() {
    super.initState();
    //hacer algo al inicio


  }


  Future<List<FeedModel>> getFeed() async{
        List<FeedModel> allfeed = new List<FeedModel>();

/*
        String url = "http://dev.outputcc.com/wsgruas/api/getSiniestros";

        var response = await http.post(
            Uri.encodeFull(url),
            body: {
              'value': "1",
            }
        );

        var list = jsonDecode(response.body);

        //print(list);


        for(var item in list){
          allsiniestro.add(new FeedModel(item["Oid"],item["Avatar"],item["Name"],item["Description"], Icon(Icons.remove_shopping_cart)));
        }
*/

    allfeed.add(new FeedModel("1","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",Icon(Icons.flash_on)));
    allfeed.add(new FeedModel("2","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",Icon(Icons.flash_on)));
    allfeed.add(new FeedModel("3","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",Icon(Icons.flash_on)));
    allfeed.add(new FeedModel("4","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",Icon(Icons.flash_on)));



        return allfeed;
      }



  @override
  Widget build(BuildContext context) {

    return Container(

        child: new FutureBuilder(
          future: getFeed() ,
          builder: (context, snapshot){
            print(snapshot.hasData);
            if(snapshot.hasData){
              List<FeedModel> allfeed = snapshot.data;
              List<ChildItemList> childList = allfeed.map((item) =>
              new ChildItemList(item.id, item.urlAvatar,item.name, item.desc,item.icon))
                  .toList();

              return Container(

                child: Column(
                  children: <Widget>[

                    new Expanded(
                      child: ListView(
                        padding: EdgeInsets.all(8.0),
                        children: childList,
                      ),
                    ),

                    new Container(padding: EdgeInsets.only(top:10.0),)
                  ],
                ),

              );



            }else{
              return LinearProgressIndicator();
            }

          },
        )
    );
  }
}


class ChildItemList extends StatefulWidget {

  final String id;
  final String urlAvatar;
  final String name;
  final String desc;
  final Widget icon;

  ChildItemList(this.id, this.urlAvatar,this.name, this.desc, this.icon);


  @override
  _ChildItemListState createState() => _ChildItemListState(this.id, this.urlAvatar,this.name, this.desc, this.icon);
}

class _ChildItemListState extends State<ChildItemList> {

  String id;
  String urlAvatar;
  String name;
  String desc;
  Widget icon;

  _ChildItemListState(this.id, this.urlAvatar,this.name, this.desc, this.icon);

  @override
  Widget build(BuildContext context) {

    return new Card(
      color: Color(0xFF0A1035),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
            ListTile(
            leading: new Container(
                width: 60.0,
                height: 60.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                     image: new DecorationImage(
                    fit: BoxFit.fill,
                  image: new NetworkImage(
                      urlAvatar)
              )
            )),
            title:  Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            subtitle: Text(desc,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
          ),

          ButtonBar(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.comment, color: Colors.white.withOpacity(.5),), //`Icon` to display
                label: Text('20',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200),), //`Text` to display
                onPressed: () {
                  //Code to execute when Floating Action Button is clicked
                  //...
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.power_settings_new, color: Colors.white.withOpacity(.5),), //`Icon` to display
                label: Text('10',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200),), //`Text` to display
                onPressed: () {
                  //Code to execute when Floating Action Button is clicked
                  //...
                },
              ),
            ],
          ),
        ],
      ),
    );
  }


}