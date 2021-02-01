import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Silver extends StatefulWidget {
  @override
  _SilverState createState() => _SilverState();
}

class _SilverState extends State<Silver> {


  final firestoreInstance = FirebaseFirestore.instance;
  bool isveg=false;
  List<Map<String, dynamic>> nonvegitems = [];
  List<Map<String, dynamic>> vegitems = [];

  void initState() {
    getNonVegData();
    getVegData();
    super.initState();
  }

  getVegData() {
    firestoreInstance
        .collection("Standard-Package")
        .where("name", isEqualTo: "Silver-Package").where("veg",isEqualTo: true)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        setState(() {
          vegitems.add(result.data());
        });
      });
    });
  }
  getNonVegData() {
    firestoreInstance
        .collection("Standard-Package")
        .where("name", isEqualTo: "Silver-Package").where("veg",isEqualTo: false)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        setState(() {
          nonvegitems.add(result.data());
        });
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 206, 107, 1),
      body: isveg==true?Container(

          child: Column(
            children: [
              Container(
                height: 600,
                child: ListView(
                  padding: EdgeInsets.all(10),

                  children: [
                    Container(
                      width: 200,
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: SwitchListTile(
                        title: Text("Vegetarian Package"),

                        value: isveg,
                        inactiveTrackColor: Color.fromRGBO(126, 17, 17, 1),
                        activeColor: Color.fromRGBO(126, 17, 17, 1),
                        onChanged: (bool val) {
                          setState(() {
                            isveg = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Staters",style: TextStyle(fontSize: 28),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(vegitems[0]["Stater-urls"][0],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(vegitems[0]["Staters"][0],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(vegitems[0]["Stater-description"][0],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },


                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(vegitems[0]["Stater-urls"][0],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(vegitems[0]["Staters"][0],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 140,
                                  child: Text(vegitems[0]["Stater-description"][0],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(vegitems[0]["Stater-urls"][1],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(vegitems[0]["Staters"][1],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(vegitems[0]["Stater-description"][1],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },

                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(vegitems[0]["Stater-urls"][1],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(vegitems[0]["Staters"][1],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 140,
                                  child: Text(vegitems[0]["Stater-description"][1],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Main-Course",style: TextStyle(fontSize: 28),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(vegitems[0]["Main-course-urls"][0],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(vegitems[0]["Main-Course"][0],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(vegitems[0]["Main-course-description"][0],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(vegitems[0]["Main-course-urls"][0],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(vegitems[0]["Main-Course"][0],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(vegitems[0]["Main-course-description"][0],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(vegitems[0]["Main-course-urls"][1],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(vegitems[0]["Main-Course"][1],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(vegitems[0]["Main-course-description"][1],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },

                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(vegitems[0]["Main-course-urls"][1],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(vegitems[0]["Main-Course"][1],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(vegitems[0]["Main-course-description"][1],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Desserts",style: TextStyle(fontSize: 28),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(vegitems[0]["Desserts-url"][0],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(vegitems[0]["Desserts"][0],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(vegitems[0]["Dessert-description"][0],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(vegitems[0]["Desserts-url"][0],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(vegitems[0]["Desserts"][0],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(vegitems[0]["Dessert-description"][0],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(vegitems[0]["Desserts-url"][1],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(vegitems[0]["Desserts"][1],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(vegitems[0]["Dessert-description"][1],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(vegitems[0]["Desserts-url"][1],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(vegitems[0]["Desserts"][1],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(vegitems[0]["Dessert-description"][1],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Beverages",style: TextStyle(fontSize: 28),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(vegitems[0]["Beverages-url"][0],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(vegitems[0]["Beverages"][0],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(vegitems[0]["Beverage-description"][0],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(vegitems[0]["Beverages-url"][0],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(vegitems[0]["Beverages"][0],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(vegitems[0]["Beverage-description"][0],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(vegitems[0]["Beverages-url"][1],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(vegitems[0]["Beverages"][1],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(vegitems[0]["Beverage-description"][1],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(vegitems[0]["Beverages-url"][1],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(vegitems[0]["Beverages"][1],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(vegitems[0]["Beverage-description"][1],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),


            ],
          )
      ):Container(
//        padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                height: 600,
                child: ListView(
                  padding: EdgeInsets.all(10),

                  children: [
                    Container(
                      width: 200,
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: SwitchListTile(
                        title: Text("Vegetarian Package"),

                        value: isveg,
                        inactiveTrackColor: Color.fromRGBO(126, 17, 17, 1),
                        activeColor: Color.fromRGBO(126, 17, 17, 1),
                        onChanged: (bool val) {
                          setState(() {
                            isveg = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Staters",style: TextStyle(fontSize: 28),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(nonvegitems[0]["Stater-urls"][0],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(nonvegitems[0]["Staters"][0],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(nonvegitems[0]["Stater-description"][0],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },


                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(nonvegitems[0]["Stater-urls"][0],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(nonvegitems[0]["Staters"][0],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,

                                  child: Text(nonvegitems[0]["Stater-description"][0],maxLines: 7,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(nonvegitems[0]["Stater-urls"][1],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(nonvegitems[0]["Staters"][1],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(nonvegitems[0]["Stater-description"][1],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },

                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(nonvegitems[0]["Stater-urls"][1],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(nonvegitems[0]["Staters"][1],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 140,
                                  child: Text(nonvegitems[0]["Stater-description"][1],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Main-Course",style: TextStyle(fontSize: 28),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(nonvegitems[0]["Main-course-urls"][0],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(nonvegitems[0]["Main-Course"][0],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(nonvegitems[0]["Main-course-description"][0],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(nonvegitems[0]["Main-course-urls"][0],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(nonvegitems[0]["Main-Course"][0],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(nonvegitems[0]["Main-course-description"][0],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(nonvegitems[0]["Main-course-urls"][1],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(nonvegitems[0]["Main-Course"][1],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(nonvegitems[0]["Main-course-description"][1],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },

                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(nonvegitems[0]["Main-course-urls"][1],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(nonvegitems[0]["Main-Course"][1],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(nonvegitems[0]["Main-course-description"][1],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Desserts",style: TextStyle(fontSize: 28),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(nonvegitems[0]["Desserts-url"][0],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(nonvegitems[0]["Desserts"][0],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(nonvegitems[0]["Dessert-description"][0],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(nonvegitems[0]["Desserts-url"][0],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(nonvegitems[0]["Desserts"][0],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(vegitems[0]["Dessert-description"][0],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(nonvegitems[0]["Desserts-url"][1],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(nonvegitems[0]["Desserts"][1],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(nonvegitems[0]["Dessert-description"][1],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(nonvegitems[0]["Desserts-url"][1],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(nonvegitems[0]["Desserts"][1],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(nonvegitems[0]["Dessert-description"][1],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Beverages",style: TextStyle(fontSize: 28),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(nonvegitems[0]["Beverages-url"][0],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(nonvegitems[0]["Beverages"][0],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(nonvegitems[0]["Beverage-description"][0],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(nonvegitems[0]["Beverages-url"][0],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(nonvegitems[0]["Beverages"][0],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(nonvegitems[0]["Beverage-description"][0],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Widget ParticularItem(){
                          return Scaffold(
                              backgroundColor: Color.fromRGBO(255, 206, 107, 1),
                              body:  Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 300,
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
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(nonvegitems[0]["Beverages-url"][1],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text(nonvegitems[0]["Beverages"][1],style: TextStyle(fontSize: 26),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                        child: Text(nonvegitems[0]["Beverage-description"][1],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                  ],
                                ),
                              )
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));

                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 200,
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
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(nonvegitems[0]["Beverages-url"][1],fit: BoxFit.fill,),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(children: [
                                Container(

                                  width: 140,
                                  child: Text(nonvegitems[0]["Beverages"][1],maxLines: 2,style: TextStyle(fontSize: 24),),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 140,
                                  height: 110,
                                  child: Text(nonvegitems[0]["Beverage-description"][1],maxLines: 8,),
                                ),


                              ],)
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),


            ],
          )
      ),
    );
  }
}
