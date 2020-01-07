import 'package:flutter/material.dart';
import 'package:tanni_app_client/Corporate/corporateHomeWidget.dart';
import 'package:tanni_app_client/Corporate/corporateProfileWidget.dart';
class Corporate extends StatefulWidget {
  @override
  _CorporateState createState() => _CorporateState();
}

class _CorporateState extends State<Corporate> {
  int id=0;
  @override
  Widget build(BuildContext context) {
    final tabpages=<Widget>[
      corporateHomeWidget(context),
      corporateProfileWidget(context),
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
    final header=UserAccountsDrawerHeader(
      accountName: Text("Tanni"),
      accountEmail: Text("Login or Register"),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 30.0,),
      ),
    );
    final items=ListView(
      children: <Widget>[
        header,

        Divider(),
        ListTile(
          title: Text("Setting"),
        ),
        ListTile(
          title: Text("Song Language"),
        ),
        ListTile(
          title: Text("Profile"),
        ),
        Divider(),
        ListTile(
          title: Text("Help"),
          leading: Icon(Icons.help),
        ),
      ],

    );

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(child: items,),
        body: tabpages[id],
        bottomNavigationBar: bnb,
      ),
    );
  }
}
