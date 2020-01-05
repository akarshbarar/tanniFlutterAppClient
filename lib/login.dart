import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Center(
            child:Container(
              width: 400.0,
              height: 400.0,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(40),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.white,// set border color
                      width: 3.0),   // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(40.0)), // set rounded corner radius
                  boxShadow: [BoxShadow(blurRadius: 10,color: Colors.red,offset: Offset(1,3))]// make rounded corner of border
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(size: 100.0,),
                  SizedBox(height: 10.0,),
                  Text("Enter Mobile Number to get OTP ",style: TextStyle(fontSize: 25.0),),
                  SizedBox(height: 10.0,),
                  TextField( autofocus: true,keyboardType: TextInputType.number,),
                  SizedBox(height: 10.0,),
                  SizedBox(height: 10.0,),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.red,
                            Colors.red
                          ]),
                          borderRadius: BorderRadius.circular(10.0),
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
                            Navigator.of(context).pushNamed('/otpPage');
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Get OTP",
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


            )
        ),
      ),
    );
  }
}

