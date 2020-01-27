import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List> getData() async{
  print("Inside get data");
  final response=await http.get("https://tanni123.000webhostapp.com/getItems.php");
  return json.decode(response.body);
}
Widget corporateHomeWidget(BuildContext context) {
  return Scaffold(
    body:  FutureBuilder<List>(
      future: getData(),
      builder: (context, snapshot) {
        print("Indide builder");
        if (snapshot.hasError)
          print(snapshot.error);
        return snapshot.hasData
            ? ItemList(list: snapshot.data,)
            : Center(child: new CircularProgressIndicator(backgroundColor: Colors.red,),);
      },
    ),
  );
}
class ItemList extends StatelessWidget{

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(list);
    return   ListView.builder(
      itemCount: list==null?0:list.length,
      itemBuilder: (context,i){
        print(list[i]);
        return GestureDetector(
          onTap: (){
          },
          child: Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: FlutterLogo(size: 42.0,),
                    ),
                    Text(" "+list[i]['Title'],style: TextStyle(fontWeight: FontWeight.bold, fontSize:30.0),),
                  ],
                ),
                SizedBox(
                  height: 180.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Image.network(list[i]['ImageUrl'])
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),

                Row(
                  children: <Widget>[
                    Text("Price:"+list[i]['Price'],style: TextStyle(color: Colors.black,fontSize: 25.0),)
                  ],
                ),

              ],
            ),
          ),

        );
      },
    );
  }
}