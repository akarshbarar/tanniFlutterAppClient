
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _locations = ['Residential', 'Corporate', 'Enterprise']; // Option 2
  String _selectedLocation; // Option 2

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
                  Navigator.of(context).pushNamed('/residential');
                }
                if(newValue=='Corporate'){
                  Navigator.of(context).pushNamed('/corporate');
                }
                if(newValue=='Enterprise'){
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
