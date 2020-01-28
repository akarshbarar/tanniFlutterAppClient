import 'package:flutter/material.dart';
import 'package:tanni_app_client/Enterprise/enterpriseHomeWidget.dart';
import 'package:tanni_app_client/Enterprise/enterpriseProfileWidget.dart';

class Enterprise extends StatefulWidget {
  @override
  _EnterpriseState createState() => _EnterpriseState();
}

class _EnterpriseState extends State<Enterprise> {
  int id=0;
  @override
  Widget build(BuildContext context) {

    final tabpages=<Widget>[
      enterpriseHomeWidget(context),
      enterpriseProfileWidget(context)
    ];

    final bnbi=<BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home,),title: Text("Home")),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle,),title: Text("Profile")),
    ];
    final bnb=BottomNavigationBar(
      items: bnbi,
      currentIndex:id ,
      type: BottomNavigationBarType.fixed,
      onTap: (int value){
        setState(() {
          id=value;
        });
      },
    );
//    final header=UserAccountsDrawerHeader(
//      accountName: Text("Tanni"),
//      accountEmail: Text("Login or Register"),
//      currentAccountPicture: CircleAvatar(
//        child: FlutterLogo(size: 30.0,),
//      ),
//    );
//    final items=ListView(
//      children: <Widget>[
//        header,
//
//        Divider(),
//        ListTile(
//          title: Text("Setting"),
//        ),
//        ListTile(
//          title: Text("Song Language"),
//        ),
//        ListTile(
//          title: Text("Profile"),
//        ),
//        Divider(),
//        ListTile(
//          title: Text("Help"),
//          leading: Icon(Icons.help),
//        ),
//      ],
//
//    );



    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close),onPressed: (){},tooltip: "Logout",),
        ],
        title: Text("Tanni"),
      ),
      //drawer: Drawer(child: items,),
      body: tabpages[id],
      bottomNavigationBar: bnb,
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.blueGrey,
        backgroundColor: Colors.red,
        tooltip: "Cart",
        child: Icon(Icons.add_shopping_cart,color: Colors.white,),
        onPressed: (){

        },
      ),
    );
  }
}