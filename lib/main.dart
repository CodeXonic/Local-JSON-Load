import 'package:flutter/material.dart';
import 'dart:convert' show json;

void main() => runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.teal
  ),
  home: new HomePage(),
)
);

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  List data;
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Load Json App"),
     ),
     body: new Container(
       child: new Center(
        child: new FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('load_json/person.json'),
          builder: (context,snapshot){
            //Decode Json
            var myData = json.decode(snapshot.data.toString());
            return new ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Name: "+ myData[index]['name']),
                        new Text("Age: "+ myData[index]['age']),
                        new Text("Height: "+ myData[index]['height']),
                        new Text("Hair Color: "+ myData[index]['hair_color']),
                        new Text("Gender: "+ myData[index]['gender']),
                      ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
            );
          } ,
        ),

       ),
     ),
   );
  }

}