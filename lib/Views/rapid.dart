import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yell_mvp/presentation/my_flutter_app_icons.dart';

class RapidModel
{
  String id;
  String urlAvatar;
  String name;
  String level;
  String kind;
  String type;
  String rank;
  String kda;
  String winrate;
  List <String> tags;

  RapidModel(this.id, this.urlAvatar, this.name, this.level, this.kind,
      this.type, this.rank, this.kda, this.winrate, this.tags);
}



class Rapid extends StatefulWidget {
  @override
  _RapidState createState() => _RapidState();
}

class _RapidState extends State<Rapid> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF0A1035),
      body: RapidList(),
    );
  }
}

class RapidList extends StatefulWidget {
  @override
  _RapidListState createState() => _RapidListState();
}

class _RapidListState extends State<RapidList> {

  Future<List<RapidModel>> getFeed() async{
    List<RapidModel> allrapid = new List<RapidModel>();

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
    List<String> variables = new List<String>();
    variables.add("2 jugadores");
    variables.add("ADC");
    variables.add("UP TO: GOLD");
    allrapid.add(new RapidModel("1","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg",
        "Edgar Luna", "123","Normal","For Fun","Silver","10/10/20","20",variables));




    return allrapid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(


        child: new FutureBuilder(
          future: getFeed() ,
          builder: (context, snapshot){
            print(snapshot.hasData);
            if(snapshot.hasData){
              List<RapidModel> allrapid = snapshot.data;
              List<ChildItemList> childList = allrapid.map((item) =>
              new ChildItemList(item.id, item.urlAvatar,item.name, item.level,item.kind,item.type,item.rank,item.kda,item.winrate,item.tags))
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
  final String level;
  final String kind;
  final String type;
  final String rank;
  final String kda;
  final String winrate;
  final List <String> tags;

  ChildItemList(this.id, this.urlAvatar, this.name, this.level, this.kind,
      this.type, this.rank, this.kda, this.winrate, this.tags);


  @override
  _ChildItemListState createState() => _ChildItemListState(this.id, this.urlAvatar, this.name, this.level, this.kind,
      this.type, this.rank, this.kda, this.winrate, this.tags);
}

class _ChildItemListState extends State<ChildItemList> {

  String id;
  String urlAvatar;
  String name;
  String level;
  String kind;
  String type;
  String rank;
  String kda;
  String winrate;
  List <String> tags;

  _ChildItemListState(this.id, this.urlAvatar, this.name, this.level, this.kind,
      this.type, this.rank, this.kda, this.winrate, this.tags);

  @override
  Widget build(BuildContext context) {

    return new Container(
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Colors.blue.withOpacity(.2),
          blurRadius: 10.0,

        ),
      ]),
      child: Card(
        shape: new RoundedRectangleBorder(
            side: new BorderSide(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(10.0)),
        color: Color(0xFF010F59),
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
              subtitle: Text(rank,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
            ),

              SizedBox(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,),
                      ),
                        height: 60,
                        child: Column(
                          children: <Widget>[
                            Text(kda,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                            Text("K/D/A",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                          ],
                        ),

                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,),
                      ),
                      height: 60,
                      child: Column(
                        children: <Widget>[
                          Text(winrate + "%",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                          Text("Win Rate",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                        ],
                      ),

                    ),
                  ],
                ),
              ),


            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(boxShadow: [
                    new BoxShadow(
                      color: Color(0xFF673BB7).withOpacity(.1),
                      blurRadius: 5.0,

                    ),
                  ]),
                  child:RaisedButton(
                    child: Text('Agendar',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),), //`Text` to display
                    color: Color(0xFF673BB7),
                    elevation: 10,

                    onPressed: () {
                      //Code to execute when Floating Action Button is clicked
                      //...
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

  }


}