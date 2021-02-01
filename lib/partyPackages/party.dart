import 'package:flutter/material.dart';
import 'package:partywalafinal/partyPackages/Gold.dart';
import 'package:partywalafinal/partyPackages/Platinum.dart';
import 'package:partywalafinal/partyPackages/Silver.dart';
import 'package:partywalafinal/partyPackages/SpecialPackage.dart';
class Party extends StatefulWidget {
  @override
  _PartyState createState() => _PartyState();
}

class _PartyState extends State<Party> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(

        backgroundColor: Color.fromRGBO(255, 206, 107, 1),
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(126, 17, 17, 1),
            title: Text("Create Package"),
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: <Widget>[
                Tab(text: "Silver\n Package",),
                Tab(text: "Gold\n Package",),
                Tab(text: "Platinum\n Package",),
                Tab(text: "Special\n Package",),
              ],
            )
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:  Color.fromRGBO(126, 17, 17, 1),
          unselectedItemColor: Colors.white,

          selectedItemColor: Color.fromRGBO(255, 206, 107, 1),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.phone,),
              label: "Contact us",

            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.announcement_outlined,),
                label: "WhatsApp"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.touch_app,),
                label: "Select-Order"
            ),
          ],
        ),
        body: Container(

          child: TabBarView(
            children: <Widget>[
              Silver(),
              Gold(),
              Platinum(),
              SpecialPackage(),


            ],
          ),
        ),
      ),
    );
  }
}
