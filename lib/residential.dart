import 'package:flutter/material.dart';
import 'package:tanni_app_client/Residential/residentialHomeWidget.dart';
import 'package:tanni_app_client/Residential/residentialProfileWidget.dart';
import 'package:tanni_app_client/Residential/residentialWalletWidget.dart';

class Residential extends StatefulWidget {
  @override
  _ResidentialState createState() => _ResidentialState();
}

class _ResidentialState extends State<Residential> {
  @override
  Widget build(BuildContext context) {
    int id = 0;
    final tabpages = <Widget>[
      residentialHomeWidget(context),
      residentialWalletWidget(context),
      residentialProfileWidget(context)
    ];

    final bnbi = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home,), title: Text("Home")),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet,), title: Text("Wallet")),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,), title: Text("Profile")),
    ];
    final bnb = BottomNavigationBar(
      items: bnbi,
      currentIndex: id,
      type: BottomNavigationBarType.fixed,
      onTap: (int value) {
        setState(() {
          id = value;
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
//      appBar: AppBar(
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.notifications),onPressed: (){},),
//          IconButton(icon: Icon(Icons.search),onPressed: (){},),
//        ],
//      ),
      //drawer: Drawer(child: items,),
      body: tabpages[id],
      bottomNavigationBar: bnb,
    );
  }
}
