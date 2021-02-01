import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor:  Color.fromRGBO(126, 17, 17, 1),
      unselectedItemColor: Colors.white,

      selectedItemColor: Color.fromRGBO(255, 206, 107, 1),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance,),
          label: "Book A Hall",

        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.headset_mic,),
            label: "Enquiry"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.not_listed_location,),
            label: "Track Order"
        ),
      ],
    );
  }
}
