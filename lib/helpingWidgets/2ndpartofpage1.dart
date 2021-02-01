import 'package:flutter/material.dart';
import 'package:partywalafinal/InstantPartyPages/instant_party.dart';
import 'package:partywalafinal/partyPackages/party.dart';
class FirstPage2 extends StatefulWidget {
  @override
  _FirstPage2State createState() => _FirstPage2State();
}

class _FirstPage2State extends State<FirstPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap:  (){

                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>Party() ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      color: Color.fromRGBO(126, 17, 17, 1),
                      width: 2,
                    ),
                    color: Colors.white,
                    boxShadow: [ BoxShadow(
                      color: Colors.brown,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                          2.0, 2.0), // shadow direction: bottom right
                    )
                    ],
                  ),
                  height: 140,
                  width: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_shipping,
                        size: 50,
                        color: Color.fromRGBO(126, 17, 17, 1),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Party-Packages",
                        style: TextStyle(
                            color: Color.fromRGBO(126, 17, 17, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>InstantParty() ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      color: Color.fromRGBO(126, 17, 17, 1),
                      width: 2,
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown,
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                        offset: Offset(
                            2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  height: 140,
                  width: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 60,
                          child: Image.asset("assets/par.png")),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Instant-Party",
                        style: TextStyle(
                            color: Color.fromRGBO(126, 17, 17, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                    color: Color.fromRGBO(126, 17, 17, 1),
                    width: 2,
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                          2.0, 2.0), // shadow direction: bottom right
                    ), // shadow direction: bottom right

                  ],
                ),
                height: 140,
                width: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 60,
                        child: Image.asset("assets/ser.png")),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Our Services",
                      style: TextStyle(
                          color: Color.fromRGBO(126, 17, 17, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                    color: Color.fromRGBO(126, 17, 17, 1),
                    width: 2,
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                          2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                height: 140,
                width: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.assignment,
                      size: 50,
                      color: Color.fromRGBO(126, 17, 17, 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Menu",
                      style: TextStyle(
                          color: Color.fromRGBO(126, 17, 17, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
