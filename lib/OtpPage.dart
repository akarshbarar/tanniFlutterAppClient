import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OtpPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String VerificationId;

  // ignore: non_constant_identifier_names
  OtpPage({@required this.VerificationId});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signInOtp(String otp)async {

    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: widget.VerificationId,
      smsCode: otp,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)) as FirebaseUser;
    final FirebaseUser currentUser = await _auth.currentUser();
    String uid = user.uid;

    assert(user.uid == currentUser.uid);
    Navigator.pop(context);
    Navigator.of(context).pushNamed('/home');
    return 'signInWithPhoneNumber succeeded: $user';

  }

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
                  Text("Enter OTP ",style: TextStyle(fontSize: 25.0),),
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

                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Verify OTP",
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
