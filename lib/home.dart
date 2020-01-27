
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
String email,password,uid;


  Home({Key key,@required this.email,@required this.password,@required this.uid}): super(key: key);

@override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _locations = ['Residential', 'Corporate', 'Enterprise']; // Option 2
  String _selectedLocation; // Option 2
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:   DropdownButton(
            hint: Text('Please choose your type'), // Not necessary for Option 1
            value: _selectedLocation,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation = newValue;
                if(newValue=='Residential'){
                  print("Inside RESIDENTIAL");
                  _database
                      .reference()
                      .child("User_Details")
                      .child(widget.uid)
                      .set({
                        "UID":widget.uid,
                        "Email":widget.email,
                        "Password":widget.password,
                        "Type":"Residential"
                      });
                  Navigator.of(context).pushNamed('/residential');
                }
                if(newValue=='Corporate'){
                  print("Inside Corporate");

                  _database
                      .reference()
                      .child("User_Details")
                      .child(widget.uid)
                      .set({
                    "UID":widget.uid,
                    "Email":widget.email,
                    "Password":widget.password,
                    "Type":"Corporate"
                  });
                  Navigator.of(context).pushNamed('/corporate');
                }
                if(newValue=='Enterprise'){//Commercial
                  print("Inside Commercial");

                  _database
                      .reference()
                      .child("User_Details")
                      .child(widget.uid)
                      .set({
                    "UID":widget.uid,
                    "Email":widget.email,
                    "Password":widget.password,
                    "Type":"Commercial"
                  });
                  Navigator.of(context).pushNamed('/enterprise');
                }
              });
            },
            items: _locations.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
