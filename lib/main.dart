import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tanni_app_client/OtpPage.dart';
import 'package:tanni_app_client/PaymentPage.dart';
import 'package:tanni_app_client/corporate.dart';
import 'package:tanni_app_client/entereprise.dart';
import 'package:tanni_app_client/home.dart';
import 'package:tanni_app_client/login.dart';
import 'package:tanni_app_client/register.dart';
import 'package:tanni_app_client/residential.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login':(context)=>Login(),
        '/register':(context)=>Register(),
        '/home':(context)=>Home(),
        '/residential':(context)=>Residential(),
        '/corporate':(context)=>Corporate(),
        '/enterprise':(context)=>Enterprise(),
        '/otpPage':(context)=>OtpPage(),
        '/payment':(context)=>PaymentPage()
      },
      theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.white
      ),
      home: SplashScreen(),
    );
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),()=>Navigator.of(context).pushReplacementNamed('/login'));
  }


  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              FlutterLogo(size: 50.0),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}