import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tanni_app_client/home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();


  // ignore: missing_return
  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    if(user.uid!=null){
      print("INSIDE FUNCION");
      Navigator.of(context).push(MaterialPageRoute(

          builder: (context){
            // ignore: missing_return
            print("INSIDE route");
            return Home(email:email,password:password,uid:user.uid);
          }
      ));

//      Navigator.of(context).pushReplacementNamed('/home');
    }
    else{
      print("SOme Error Ocured");
    }
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
                  Text("Sign Up ",
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
                    autofocus: true,
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
                    autofocus: true,
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
                               signUp(emailController.text, passwordController.text);
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Register",
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
                    child: Text("Already have a account"),
                    onPressed: (){
                        Navigator.of(context).pop();
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
