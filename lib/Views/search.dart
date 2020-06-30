import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class ResultModel
{
  String id;
  String url;
  String title;
  String desc;


  ResultModel(this.id, this.url , this.title, this.desc);
}


class SearchList extends StatefulWidget {
  SearchList({ Key key }) : super(key: key);
  @override
  _SearchListState createState() => new _SearchListState();

}




class _SearchListState extends State<SearchList>
{

  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  bool _IsSearching;
  Widget waitSeearch = new Container();
  String _searchText = "";

  List<ChildItem> allResults = new List<ChildItem>();



  Future<List <ResultModel>> _getResults() async {

    List <ResultModel> listcurrent = new List <ResultModel>();

/*    try {
      var pos = await location.getLocation();
      //https://maps.googleapis.com/maps/api/geocode/json?latlng="+pos.latitude.toString()+","+pos.longitude.toString()+"&key=AIzaSyAIfk8lGaWZR7j544wnzmvUR1QWoc6zpfk
      String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+pos.latitude.toString()+","+pos.longitude.toString()+"&key=AIzaSyAIfk8lGaWZR7j544wnzmvUR1QWoc6zpfk";

      var response = await http.get(
          Uri.encodeFull(url)
      );

      var mydata = jsonDecode(response.body);
      listcurrent.add(new DirModel(mydata["results"][0]["formatted_address"], mydata["results"][0]["geometry"]["location"]["lat"].toString(),mydata["results"][0]["geometry"]["location"]["lng"].toString()));

    } catch (e) {
      print(e);

    }*/

    listcurrent.add(new ResultModel("1","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",));
    listcurrent.add(new ResultModel("2","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",));
    listcurrent.add(new ResultModel("3","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",));
    listcurrent.add(new ResultModel("4","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",));
    return listcurrent;
  }




  @override
  void initState() {
    super.initState();
    //aqui empieza la logica de inisializacion
    _IsSearching = false;


  }


  @override
  Widget build(BuildContext context) {
    Widget listResultados = new LinearProgressIndicator();
    int _selectedIndex = 0;

    return new Scaffold(
      key: key,
      appBar: buildBar(context),
      backgroundColor: Color(0xFF0A1035),
      body: new FutureBuilder(
        future: _getResults() ,
        builder: (context, snapshot){

          if(snapshot.hasData){

            print("Entro a hasdata");
            List<ResultModel> list = snapshot.data;


            return  Container(

              child: Column(
                children: <Widget>[
                  new SizedBox(
                    height: 50,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                child: new FilterChip(
                                  label: Text("Search All", style: TextStyle(color: Colors.white),),
                                  onSelected: (bool value){
                                    setState(() {
                                      if(value){
                                        _selectedIndex = 0;

                                        //filta por todos ylv
                                      }else{

                                      }
                                    });
                                  },

                                    selectedColor: Color(0xFF673BB7),
                                    selected: _selectedIndex == 0,


                                ),
                                padding: EdgeInsets.only(left: 10.00),
                              ),
                              Container(
                                child: new FilterChip(
                                  label: Text("Players"),
                                  onSelected: (bool value){
                                    setState(() {
                                      if(value){
                                        _selectedIndex = 1;
                                        print("_selectedIndex: "+ _selectedIndex.toString());
                                        //filta por players ylv
                                      }else{

                                      }
                                    });
                                  },
                                  selectedColor: Color(0xFF673BB7),
                                  selected: _selectedIndex == 1

                                ),
                                padding: EdgeInsets.only(left: 10.00),
                              ),
                              Container(
                                child: new FilterChip(
                                  label: Text("Teams"),
                                  onSelected: (bool value){
                                    setState(() {
                                      if(value){
                                        _selectedIndex = 2;
                                        //filta por teams ylv
                                      }else{

                                      }
                                    });
                                  },
                                    selectedColor: Color(0xFF673BB7),
                                    selected: _selectedIndex == 1
                                ),
                                padding: EdgeInsets.only(left: 10.00),
                              ),
                              Container(
                                child: new FilterChip(
                                  label: Text("News"),
                                  onSelected: (bool value){
                                    setState(() {
                                      if(value){
                                        _selectedIndex = 3;
                                        //filta por news ylv
                                      }else{

                                      }
                                    });
                                  },
                                    selectedColor: Color(0xFF673BB7),
                                    selected: _selectedIndex == 1
                                ),
                                padding: EdgeInsets.only(left: 10.00),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  new Container(padding: EdgeInsets.only(top: 20.0),),
                  new ChildItem(list[0].id,list[0].url,list[0].title, list[0].desc),
                  new Divider(),
                  waitSeearch,
                  new Expanded(
                    child: allResults.length>0 ? new ListView(
                      padding: new EdgeInsets.symmetric(vertical: 8.0),
                      children: allResults,
                    ) : new Text(""),
                  )

                ],
              ),

            );


          }else{
            return LinearProgressIndicator();
          }

        },
      ),
    );
  }

  Future _getAllResult() async {

    List <ResultModel> listcurrentresults = new List <ResultModel>();

/*    try {

      String url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input="+_searchText.toLowerCase()+"&components=country:MX&key=AIzaSyAIfk8lGaWZR7j544wnzmvUR1QWoc6zpfk";

      var response = await http.get(
          Uri.encodeFull(url)
      );

      var mydata = jsonDecode(response.body);


    } catch (e) {
      print(e);

    }*/

    listcurrentresults.add(new ResultModel("1","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",));
    listcurrentresults.add(new ResultModel("2","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",));
    listcurrentresults.add(new ResultModel("3","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",));
    listcurrentresults.add(new ResultModel("4","https://res.cloudinary.com/elunap/image/upload/c_crop,w_300,g_faces/v1584902619/rodolfo.jpg", "Edgar Luna", "Lorem ipsum dolore ameno, me gusta el chocolate pero me gustan más tus labios bb",));

    setState(() {

      waitSeearch = new Container();

      if(listcurrentresults != null){
        allResults = listcurrentresults.map((contact) => new ChildItem(contact.id, contact.url, contact.title, contact.desc))
            .toList();
      }


    });


  }



  Widget buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: Stack(
        children: <Widget>[


          new TextField(
            onSubmitted: (newValue) {

              setState(() {
                waitSeearch = new LinearProgressIndicator();
              });
              _searchText = newValue;
              _IsSearching = true;
              _getAllResult();
            },
            //controller: _searchQuery,
            style: new TextStyle(
              color: Colors.white,

            ),
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(100.0),

                ),

              ),
              prefixIcon: new Icon(Icons.search, color: Colors.white),
              hintText: "Buscar, cosas?...",
              hintStyle: new TextStyle(color: Colors.white),
              fillColor: Color(0xFF0A1035),
              filled: true,
                contentPadding: EdgeInsets.all(10)


            ),
          ),


        ],
      )
    );
  }


}


class ChildItem extends StatelessWidget {
  final String id;
  final String url;
  final String title;
  final String desc;

  ChildItem(this.id,this.url, this.title, this.desc);
  @override
  Widget build(BuildContext context) {


    return new ListTile(
      leading: new Container(
          width: 60.0,
          height: 60.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      url)
              )
          )),
      title:  Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      subtitle: Text(desc,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),

      onTap:() {

        print(id);


        /*Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => new Solicitar())
        );*/



      },

    );
  }



}