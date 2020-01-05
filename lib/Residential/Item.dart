
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Item extends StatefulWidget {
  String imageUrl;
  String title;
  String price;

  Item({Key key,@required this.imageUrl,@required this.title,@required this.price}):super(key: key);

  @override
  _ItemState createState() => _ItemState(
      imageUrl: imageUrl,
    title: title,
    price: price
  );
}

class _ItemState extends State<Item> {
  String imageUrl;
  String title;
  String price;
  int quantity=0;
  _ItemState({Key key,@required this.imageUrl,@required this.title,@required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: FlutterLogo(size: 42.0,),
                      ),
                      Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize:30.0),),
                    ],
                  ),
                  SizedBox(
                    height: 180.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: Image.network(imageUrl)
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0),),

                  Row(
                    children: <Widget>[
                      Text("Price:"+price,style: TextStyle(color: Colors.black,fontSize: 25.0),)
                    ],
                  ),
                  Text("5 tanni points near you",style: TextStyle(color: Colors.red),),
                  SizedBox(
                    height: 20.0,
                  ),
                 Padding(
                   padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width-150),
                   child: Row(
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: "btn1",
                          onPressed: (){
                          setState(() {
                            if(quantity!=0)
                            {
                              --quantity;
                            }
                            if(quantity==1)
                              price="35";
                            if(quantity==2)
                              price="68";
                            if(quantity==3)
                              price="101";
                            if(quantity==4)
                              price="135";
                          });
                        },child: Icon(Icons.remove),),
                        Text(quantity.toString()),
                        FloatingActionButton(
                          heroTag: "btn2",
                          onPressed: (){
                          setState(() {
                            if(quantity<4){
                              ++quantity;
                            }
                            if(quantity==1)
                              price="35";
                            if(quantity==2)
                              price="68";
                            if(quantity==3)
                              price="101";
                            if(quantity==4)
                              price="135";
                          });
                        },child: Icon(Icons.add),),
                      ],
                   ),
                 ),

                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: (){
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.red,
                            Colors.red
                          ]),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6078ea).withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0)
                          ]),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed("/payment");
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Procees to pay",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                                Icon(Icons.arrow_forward,color: Colors.white,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
