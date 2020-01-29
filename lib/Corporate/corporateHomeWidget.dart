import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:http/http.dart' as http;
final FirebaseDatabase _database = FirebaseDatabase.instance;

String ip;
Future<List> getData() async{

  _database.reference().child("Server").once().then((DataSnapshot snapshot) async{
    ip=snapshot.value;
    print("IP::"+ip);
  });

  print("Inside get data");
  final response=await http.get("${ip}/commercial/getItems");
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
          child: GFCard(
            boxFit: BoxFit.cover,
            image: Image.network('https://upload.wikimedia.org/wikipedia/commons/0/09/Dalian%2C_China%2C_satellite_image%2C_LandSat-5%2C_2010-08-03.jpg'),
            title: GFListTile(
                title: Text("Number Of Bottles::"+list[i]['NumberOfBottles'],style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold
                ),),
                icon: GFIconButton(
                  color: GFColor.danger,
                  onPressed: (){},
                  icon: Icon(Icons.favorite_border),

                )
            ),
            content: Text("Price::"+list[i]['Price']),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  color: GFColor.danger,
                  onPressed: () {},
                  text: 'Buy',
                  shape: GFButtonShape.pills,
                  fullWidthButton: true,
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}

