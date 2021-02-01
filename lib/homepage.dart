import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:partywalafinal/helpingWidgets/2ndpartofpage1.dart';
import 'package:partywalafinal/helpingWidgets/3rdpartofpage1.dart';
import 'package:partywalafinal/helpingWidgets/bottomNavigation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:partywalafinal/helpingWidgets/authenticationservices.dart';
import 'package:image_fade/image_fade.dart';












class PartyWala extends StatefulWidget {
  @override
  _PartyWalaState createState() => _PartyWalaState();
}

class _PartyWalaState extends State<PartyWala> {
  final myInstance = FirebaseFirestore.instance;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;
  String latlon;
  String sublocality;
  double lat;
  double long;
  List<String> bannerlist = [];

  int currentindex;

  getdataforbanner() {
    myInstance
        .collection("Item-Master")
        .where("banner", isEqualTo: true)
        .get()
        .then((value) {
      value.docs.forEach((doc) {
        setState(() {
          bannerlist.add(doc.data()["image-url"]);
        });
      });
    });
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(_currentPosition);
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.name},${place.locality},${place.administrativeArea}, ${place.postalCode}, ${place.country} ";
        latlon = "${place.position}";
        sublocality = "${place.subLocality}";
        lat = place.position.latitude;
        long = place.position.longitude;
        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getCurrentLocation();
    getdataforbanner();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    final AuthenticationService _auth = AuthenticationService();
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 206, 107, 1),
      appBar: AppBar(
        title: Text("Location"),
        backgroundColor: Color.fromRGBO(126, 17, 17, 1),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {

          }),
          IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
      drawer: Drawer(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            children: [
              ListTile(leading: Icon(Icons.logout,color: Colors.pink[800],),
                title: Text("Log-Out"),
                onTap: () async {
                 await _auth.signOut();},),
            ],
          ),
        )

      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.brown[400],
                          offset: Offset(2, 2),
                          blurRadius: 8)
                    ]),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.blue[900],
                      ),
                      title: TextField(
                        decoration: InputDecoration(
                            hintText: "What would you like to eat!",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            border: InputBorder.none),
                      ),
                      trailing: Icon(
                        Icons.filter_list,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          height: screenwidth / 2 - 100,
                          child: Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            "Manage Party At \nYour Finger Tips",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: screenwidth / 2+20,
                      width: 260,
                      child: CarouselSlider(
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        autoPlayInterval: Duration(seconds: 3),
                        scrollDirection: Axis.horizontal,
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                        enlargeCenterPage: true,
                        autoPlay: true,
                        items: bannerlist.map((imgUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                               child:FadeInImage.assetNetwork(placeholder: 'assets/loading.jpg', image: imgUrl,fit: BoxFit.fill,)
//
//                                  Image.network(
//                                    imgUrl,
//                                    fit: BoxFit.fill,
//                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                FirstPage2(),
                SizedBox(
                  height: 10,
                ),
                Text("Customize Your Package",style: TextStyle(fontSize: 28),),
                FirstPage3(),

              ],
            ),
          )
        ],
      ),
    );
  }
}
