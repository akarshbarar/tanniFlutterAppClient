import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tanni_app_client/OtpPage.dart';
import 'package:tanni_app_client/PaymentPage.dart';
import 'package:tanni_app_client/corporate.dart';
import 'package:tanni_app_client/entereprise.dart';
import 'package:tanni_app_client/home.dart';
import 'package:tanni_app_client/login.dart';
import 'package:tanni_app_client/register.dart';
import 'package:tanni_app_client/residentail.dart';
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