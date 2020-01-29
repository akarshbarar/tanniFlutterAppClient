import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String numberOfBottles,price;
  // ignore: non_constant_identifier_names
  Details({Key key,@required String numberOfBottles,@required String price}): super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
   print(widget.numberOfBottles);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
//              Text(widget.NumberOfBottles),
//              Text(widget.price)
            ],
          ),
        ),
      ),
    );
  }
}
