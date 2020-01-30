import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/colors/gf_color.dart';
import 'package:getflutter/getflutter.dart';
import 'package:toast/toast.dart';
import 'package:mysql1/mysql1.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String numberOfBottles,price;

  Details(this.numberOfBottles, this.price); // ignore: non_constant_identifier_names


  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  TextEditingController mobileController=new TextEditingController();
  TextEditingController nameController=new TextEditingController();
  TextEditingController addressController=new TextEditingController();
  String uid;

  Future<String> inputData() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
     uid = user.uid.toString();
    return uid;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputData();

  }
  @override
  Widget build(BuildContext context) {
   print(widget.numberOfBottles);
    return SafeArea(
      child: Scaffold(

        body: ListView(
          children: <Widget>[
//              Text(widget.NumberOfBottles),
//              Text(widget.price)
            GFCard(
              boxFit: BoxFit.cover,
              image: Image.network('https://upload.wikimedia.org/wikipedia/commons/0/09/Dalian%2C_China%2C_satellite_image%2C_LandSat-5%2C_2010-08-03.jpg'),
              title: GFListTile(
                  title: Text("Number of Bottles:"+widget.numberOfBottles+"\nPrice"+widget.price,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0
                  ),),
              ),
            ),
            TextField(
              controller: nameController,
              decoration: new InputDecoration(
                  hintText: 'Enter Name',
                  icon: new Icon(
                    Icons.supervised_user_circle,
                    color: Colors.grey,
                  )),
            ),
            TextField(
              controller: addressController,
              decoration: new InputDecoration(
                  hintText: 'Enter Address',
                  icon: new Icon(
                    Icons.home,
                    color: Colors.grey,
                  )),
            ),
            TextField(
              controller: mobileController,
              decoration: new InputDecoration(
                  hintText: 'Enter Mobile Number',
                  icon: new Icon(
                    Icons.phone_android,
                    color: Colors.grey,
                  )),
            ),
            GFButton(
              onPressed: () {
              _database
                  .reference()
                  .child("User_Details")
                  .child(uid)
                  .child("Type").once().then((DataSnapshot snapshot) async{
                      _database.reference()
                          .child("Orders")
                          .child(snapshot.value.toString())
                          .child(uid)
                          .set(
                            {
                              "Name":nameController.text.toString(),
                              "Address":addressController.text.toString(),
                              "Mobile":mobileController.text.toString(),
                              "Number Of Bottles":widget.numberOfBottles,
                              "Price":widget.price,
                              "Type":snapshot.value.toString()
                            }
                      );


              });
               Toast.show("Procced to pay", context);
              },
              text: 'Proceed to pay',
              color: GFColor.danger,
              fullWidthButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
