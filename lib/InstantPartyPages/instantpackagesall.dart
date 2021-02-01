import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';



class All extends StatefulWidget {
  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {

  final firestoreInstance = FirebaseFirestore.instance;
  bool isveg = false;
  List<Map<String, dynamic>> nonvegitems = [];
  List<Map<String, dynamic>> vegitems = [];

  void initState() {
    getVegData();
    getnonVegData();
    super.initState();
  }


  getVegData() {
    firestoreInstance
        .collection("Instant-Package")
        .where("veg", isEqualTo: true)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        setState(() {
          vegitems.add(result.data());
        });
      });
    });
  }

  getnonVegData() {
    firestoreInstance
        .collection("Instant-Package")
        .where("veg", isEqualTo: false)
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
    return  Container(
        padding: EdgeInsets.fromLTRB(5, 10,5, 0),
        child:Column(
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
            SizedBox(height: 10,),
            isveg==true?Expanded(

              child: ListView.separated(itemBuilder: (context,index){

                return GestureDetector(
                  onTap: (){

                    Widget ParticularItem(){
                      return Scaffold(
                        body: Container(
                          color: Color.fromRGBO(255, 206, 107, 1),
                          child:ListView(
                            children: [
                              Column(children: [
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
                                      child: Image.network(vegitems[index]["image-url"],fit: BoxFit.fill,),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                    child: Text(vegitems[index]["name"],style: TextStyle(fontSize: 26),)),
                                SizedBox(height: 10,),
                                Container(
                                    padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                    child: Text(vegitems[index]["Description"],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                Text("Items in this Package",style: TextStyle(fontSize: 26)),
                              ],),
                              Container(
                                height: 500,
                                child: ListView.separated(
                                    separatorBuilder: (context,index){
                                      return SizedBox(height: 2,);
                                    },
                                    itemCount: vegitems[index]["Items"].length,

                                    itemBuilder: (context,index1){
                                      return Container(
                                        margin: EdgeInsets.all(20),
                                        padding: EdgeInsets.all(10),
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
                                            Container(
                                              width: 175,
                                              height: 140,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(20),
                                                  child: Image.network(vegitems[index]["Items-urls"][index1],fit: BoxFit.fill,)),
                                            ),
                                            SizedBox(width: 15,),
                                            Container(
                                              width: 130,
                                              child:  Text(vegitems[index]["Items"][index1],maxLines:2,style: TextStyle(fontSize: 18),),
                                            )
                                          ],
                                        ),

                                      );
                                    }),
                              )

                            ],
                          ),

                        ),
                      );
                    }

                    Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 2),
                    height: 250,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 175,
                              height: 140,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(vegitems[index]["image-url"],fit: BoxFit.fill,),
                              ),
                            ),
                            Text("₹"+vegitems[index]["price"].toString(),style: TextStyle(fontSize: 30),),
                            RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.add_shopping_cart,color: Colors.black), label: Text("Add to Cart",style: TextStyle(color: Colors.black),),color: Colors.blue[300],)
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [

                            Container(
                              width:150,
                              child:  Text(vegitems[index]["name"],style: TextStyle(fontSize: 26),),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 150,
                              height: 140,
                              child:  Text(vegitems[index]["Description"],maxLines: 8,style: TextStyle(fontSize: 15),),

                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                );

              },
                separatorBuilder: (context,index){
                  return SizedBox(height: 20);
                },
                itemCount: vegitems.length,),
            ):Expanded(

              child: ListView.separated(itemBuilder: (context,index){

                return GestureDetector(
                  onTap: (){
                    Widget ParticularItem(){
                      return Scaffold(
                        body: Container(
                          color: Color.fromRGBO(255, 206, 107, 1),
                          child:ListView(
                            children: [
                              Column(children: [
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
                                      child: Image.network(nonvegitems[index]["image-url"],fit: BoxFit.fill,),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                    child: Text(nonvegitems[index]["name"],style: TextStyle(fontSize: 26),)),
                                SizedBox(height: 10,),
                                Container(
                                    padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                    child: Text(nonvegitems[index]["Description"],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                Text("Items in this Package",style: TextStyle(fontSize: 26)),
                              ],),
                              Container(
                                height: 500,
                                child: ListView.separated(
                                    separatorBuilder: (context,index){
                                      return SizedBox(height: 10,);
                                    },
                                    itemCount: nonvegitems[index]["Items"].length,

                                    itemBuilder: (context,index1){
                                      return Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
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
                                            Container(
                                              width: 175,
                                              height: 140,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(20),
                                                  child: Image.network(nonvegitems[index]["Items-urls"][index1],fit: BoxFit.fill,)),
                                            ),
                                            SizedBox(width: 15,),
                                            Container(
                                              width: 130,
                                              child:  Text(nonvegitems[index]["Items"][index1],maxLines:2,style: TextStyle(fontSize: 18),),
                                            )
                                          ],
                                        ),

                                      );
                                    }),
                              )

                            ],
                          ),

                        ),
                      );
                    }

                    Navigator.push(context, MaterialPageRoute(builder:(context)=>ParticularItem() ));
                  },


                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 2),
                    height: 250,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 175,
                              height: 140,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(nonvegitems[index]["image-url"],fit: BoxFit.fill,),
                              ),
                            ),
                            Text("₹"+nonvegitems[index]["price"].toString(),style: TextStyle(fontSize: 30),),
                            RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.add_shopping_cart,color: Colors.black), label: Text("Add to Cart",style: TextStyle(color: Colors.black),),color: Colors.blue[300],)
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [

                            Container(
                              width:150,
                              child:  Text(nonvegitems[index]["name"],style: TextStyle(fontSize: 26),),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 150,
                              height: 140,
                              child:  Text(nonvegitems[index]["Description"],maxLines:8,style: TextStyle(fontSize: 15),),

                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );

              },
                separatorBuilder: (context,index){
                  return SizedBox(height: 5                                                         );
                },
                itemCount: nonvegitems.length,),
            )

          ],
        )
    );
  }
}
