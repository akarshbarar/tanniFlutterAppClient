import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List> getData() async{
  print("Inside get data");
  final response=await http.get("https://fc1384ae.ngrok.io/commercial/getItems");
  return json.decode(response.body);
}
Widget enterpriseHomeWidget(BuildContext context) {
  return Center(
    child: FutureBuilder<List>(
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
//            Navigator.of(context).push(
//              MaterialPageRoute(
//                  builder: (context){
//                    return Item(
//                      imageUrl:list[i]['ImageUrl'],
//                      title: list[i]['Title'],
//                      price: list[i]['Price'],
////
////
////                          l
//                    );
//                  }
//              ),
//            );
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
                    Text(" "+list[i]['NumberOfBottles'],style: TextStyle(fontWeight: FontWeight.bold, fontSize:30.0),),
                  ],
                ),
//                SizedBox(
//                  height: 180.0,
//                  child: Stack(
//                    children: <Widget>[
//                      Positioned.fill(
//                          child: Image.network(list[i]['ImageUrl'])
//                      )
//                    ],
//                  ),
//                ),
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

