import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:partywalafinal/InstantPartyPages/instantodayspecial.dart';
import 'package:partywalafinal/InstantPartyPages/instantpackagesall.dart';
import 'package:partywalafinal/InstantPartyPages/instantspecialoffer.dart';

class InstantParty extends StatefulWidget {
  @override
  _InstantPartyState createState() => _InstantPartyState();
}

class _InstantPartyState extends State<InstantParty> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Color.fromRGBO(255, 206, 107, 1),
          appBar: AppBar(
            title: Text("Instant Party Packages"),
            backgroundColor: Color.fromRGBO(126, 17, 17, 1),
            bottom: TabBar(

              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: [
                Tab(text: "ALL Packages",),
                Tab(text: "Today's Special",),
                Tab(text: "Special Offers",),

              ],
            ),
          ),
          body:Container(

            child: TabBarView(
              children: [
                All(),
                InstantSpecial(),
                InstantOffer(),


              ],
            ),
          )
      ),
    );
  }
}

