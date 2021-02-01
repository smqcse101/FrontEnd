import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:partywalafinal/scopemodel/scopedmodelofparty.dart';

class Customize extends StatefulWidget {
  String name;


  Customize(this.name);
  @override
  _CustomizeState createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> {
  bool isveg=false;

  List<Map<String,dynamic>> particular=[];



  @override
  void initState() {

    if(widget.name=="Staters") forstaters();
    if(widget.name=="South-Indian") forsouthindian();
    if(widget.name=="Desserts") fordesserts();
    if(widget.name=="Beverages") forbeverages();
    if(widget.name=="Fast-Food") forfastfood();
    if(widget.name=="Hyderabadi") forhyderabadi();

    super.initState();
  }
  void forstaters() {
    final myInstance = FirebaseFirestore.instance;
    myInstance
        .collection("Item-Master")
        .where("course", isEqualTo: "stater")
        .get()
        .then((value) {
      value.docs.forEach((doc) {

        setState(() {

          particular.add(doc.data());


        });


      });
    });
  }
  void forbeverages() {
    final myInstance = FirebaseFirestore.instance;
    myInstance
        .collection("Item-Master")
        .where("course", isEqualTo: "beverages")
        .get()
        .then((value) {
      value.docs.forEach((doc) {

        setState(() {

          particular.add(doc.data());


        });


      });
    });
  }
  void fordesserts() {
    final myInstance = FirebaseFirestore.instance;
    myInstance
        .collection("Item-Master")
        .where("course", isEqualTo: "dessert")
        .get()
        .then((value) {
      value.docs.forEach((doc) {

        setState(() {

          particular.add(doc.data());


        });


      });
    });
  }
  void forsouthindian() {
    final myInstance = FirebaseFirestore.instance;
    myInstance
        .collection("Item-Master")
        .where("sub-category", isEqualTo: "south-indian")
        .get()
        .then((value) {
      value.docs.forEach((doc) {

        setState(() {

          particular.add(doc.data());




        });


      });
    });
  }
  void forfastfood() {
    final myInstance = FirebaseFirestore.instance;
    myInstance
        .collection("Item-Master")
        .where("sub-category", isEqualTo: "fast-food")
        .get()
        .then((value) {
      value.docs.forEach((doc) {

        setState(() {

          particular.add(doc.data());




        });


      });
    });
  }
  void forhyderabadi() {
    final myInstance = FirebaseFirestore.instance;
    myInstance
        .collection("Item-Master")
        .where("regional-category", isEqualTo: "hyderabadi")
        .get()
        .then((value) {
      value.docs.forEach((doc) {

        setState(() {

          particular.add(doc.data());




        });


      });
    });
  }


  @override

  Widget build(BuildContext context) {

      return ScopedModelDescendant<PartyModel>(builder: (BuildContext context, Widget child, PartyModel model){
        return  Scaffold(
          backgroundColor: Color.fromRGBO(255, 206, 107, 1),
          appBar: AppBar(
            title: Text("Make your custom package from variety of categories",maxLines: 2,),
            backgroundColor: Color.fromRGBO(126, 17, 17, 1),
          ),
          body: Column(
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
              Container(
                margin: EdgeInsets.all(10),
                height: 150,
                width: MediaQuery.of(context).size.width,
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
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.separated(
                      separatorBuilder: (context,index){
                        return SizedBox(width: 20,);
                      },
                      itemCount: model.selectedItemname.length,
                      scrollDirection: Axis.horizontal,


                      itemBuilder: (context,index){return Column(
                        children: [
                          Container(height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey[400],
                                      offset: Offset(1,1),
                                      blurRadius: 4)
                                ]
                            ),
                            child: Image.network(model.selectedItemurl[index],width: 60,fit: BoxFit.fill,),),
                          SizedBox(height: 10,),
                          Text(model.selectedItemname[index]),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: (){
                              model.removeitem(index);
                              setState(() {

                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              color:  Color.fromRGBO(126, 17, 17, 1),

                              child: Center(child: Text("Remove",style: TextStyle(color: Colors.white),)),
                            ),
                          )

                        ],
                      );

                      }),
                ),

              ),
              Text(widget.name,style: TextStyle(fontSize: 30),),
              Container(
                margin: EdgeInsets.all(2),
                height: 450,
                child: ListView.separated(
                    separatorBuilder: (context,index){
                      return SizedBox(height: 20,);
                    },

                    itemCount: particular.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
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
                                            child: Image.network(particular[index]["image-url"],fit: BoxFit.fill,),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                          child: Text(particular[index]["item-name"],style: TextStyle(fontSize: 26),)),
                                      SizedBox(height: 10,),
                                      Container(
                                          padding:EdgeInsets.fromLTRB(20, 0, 20, 5),
                                          child: Text(particular[index]["item-description"],maxLines: 20,style: TextStyle(fontSize: 15),)),
                                    ],
                                  ),
                                )
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
                                      child: Image.network(particular[index]["image-url"],fit: BoxFit.fill,),
                                    ),
                                  ),
                                  Text("₹"+particular[index]["price"].toString(),style: TextStyle(fontSize: 30),),
                                  RaisedButton.icon(onPressed: (){

                                    model.selectedItemname.add(particular[index]["item-name"].toString());
                                    model.selectedItemurl.add(particular[index]["image-url"].toString());
                                    setState(() {

                                    });


                                  }, icon: Icon(Icons.add_shopping_cart,color: Colors.black), label: Text("Add to Package",style: TextStyle(color: Colors.black),),color: Colors.blue[300],)
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [

                                  Container(
                                    width:150,
                                    child:  Text(particular[index]["item-name"],style: TextStyle(fontSize: 26),),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: 150,
                                    height: 140,
                                    child:  Text(particular[index]["item-description"],maxLines:8,style: TextStyle(fontSize: 15),),

                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),


              ),

            ],
          ),


        );
      });

  }
}
