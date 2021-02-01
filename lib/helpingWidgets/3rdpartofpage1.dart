import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partywalafinal/customizingpackages/customize.dart';

class FirstPage3 extends StatefulWidget {
  @override
  _FirstPage3State createState() => _FirstPage3State();
}

class _FirstPage3State extends State<FirstPage3> {
  List<String> images=["assets/staters.png","assets/southindian.png","assets/chinese.png","assets/fast.png","assets/charminar.png","assets/guj.png","assets/raje.png","assets/desserts.png","assets/drinks.jpg"];
  List<String> names=["Staters","South-Indian","Chinese","Fast-Food","Hyderabadi","Gujurati","Rajesthani","Desserts","Beverages"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5,10),
      height: 110,
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
            return SizedBox(width: 30,);
          },
            itemCount: images.length,
            scrollDirection: Axis.horizontal,


            itemBuilder: (context,index){return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Customize(names[index])));
                  },
                  child: Container(height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey[400],
                              offset: Offset(1,1),
                              blurRadius: 4)
                        ]
                    ),
                  child: Image.asset(images[index],width: 50,),),
                ),
                SizedBox(height: 10,),
                Text(names[index]),
              ],
            );}),
      ),

    );
  }
}
