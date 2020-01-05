import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:tanni_app_client/Residential/Item.dart';

final List<String> status=["A","B","c","d","e","f","g","h","i","j"];

Future<List> getData() async{
  print("Inside get data");
  final response=await http.get("https://tanni123.000webhostapp.com/getItems.php");
  return json.decode(response.body);
}
final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];

Widget residentialHomeWidget(BuildContext context) {
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
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context){
                      return Item(
                        imageUrl:list[i]['ImageUrl'],
                        title: list[i]['Title'],
                        price: list[i]['Price'],
//
//
//                          l
                      );
                    }
                ),
              );
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

//  return Center(
//    child: Container(
//      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//      height: MediaQuery.of(context).size.height * 0.35,
//      child: ListView.builder(
//          scrollDirection: Axis.horizontal,
//          itemCount: numbers.length, itemBuilder: (context, index) {
//        return Container(
//          width: MediaQuery.of(context).size.width * 0.6,
//          child: Card(
//            color: Colors.blue,
//            child: Container(
//              child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
//            ),
//          ),
//        );
//      }),
//    ),
//  );





//return new ListTile(
//
//title: new Text(list[i]['Title']),
//subtitle: new Text(list[i]['Price']),
//leading: new Icon(Icons.http),
//onTap:(){}
//);


