import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/colors/gf_color.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/components/toast/gf_toast.dart';
import 'package:getflutter/types/gf_button_type.dart';
import 'package:tanni_app_client/OtpPage.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController mobileController=new TextEditingController();
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  String verificationId,type;

  Future<void>  sendOtpToMobileNumber(String mobileNumber) async {

    PhoneVerificationCompleted verificationCompleted=(AuthCredential auth){
      setState(() {
        print('Phone number verification Compled.');}
      );
    };
    final PhoneVerificationFailed verificationFailed = (AuthException authException) {
      setState(() {
        print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');}
      );
    };

    final PhoneCodeSent codeSent = (String verificationId, [int forceResendingToken]) async {
      this.verificationId = verificationId;
      print("code sent to " + mobileNumber);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=>OtpPage( VerificationId: verificationId,)
      ),);
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
      print("time out");
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mobileNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password).then((i){
          FirebaseUser user = i.user;
          if(user.uid!=null){
           _database
                .reference()
                .child("User_Details")
                .child(user.uid)
                .child("Type").once().then((DataSnapshot snapshot) async{
                 type=snapshot.value;
                 if(type=='Residential'){
                   print("Inside RESIDENTIAL");

                   Navigator.of(context).pushNamed('/residential');
                 }
                 if(type=='Corporate'){
                   print("Inside Corporate");


                   Navigator.of(context).pushNamed('/corporate');
                 }
                 if(type=='Commercial'){//Commercial
                   print("Inside Commercial");

                   Navigator.of(context).pushNamed('/enterprise');
                 }
           });

           // Navigator.of(context).pushReplacementNamed('/home');
          }
        }).catchError((e){
             // Toast.show("Error", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              GFToast(
                text:'Error”',
                button: GFButton(
                  onPressed: () {},
                  text: 'Close',
                  type: GFButtonType.transparent,
                  color: GFColor.success,
                ),
                autoDismiss: false,
              );
        });
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
              height: 500.0,
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
                  Text("Sign-In ",
                    style: TextStyle(fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0,),
//                  TextField(
//                    autofocus: true,
//                    keyboardType: TextInputType.number,
//                    controller: mobileController,
//                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: new InputDecoration(
                        hintText: 'Email',
                        icon: new Icon(
                          Icons.mail,
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(height: 10.0,),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    obscureText: true,
                    decoration: new InputDecoration(
                        hintText: 'Password',
                        icon: new Icon(
                          Icons.lock,
                          color: Colors.grey,
                        )),
                  ),
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
//                            sendOtpToMobileNumber(mobileController.text);
                            signIn(emailController.text, passwordController.text);

                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Login",
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
                  FlatButton(
                    child: Text("Create a Account"),
                    onPressed: (){
                      Navigator.of(context).pushNamed('/register');
                    },
                  ),
                ],
              ),


            )
        ),
      ),
    );
  }
}

