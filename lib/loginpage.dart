import 'package:flutter/material.dart';
import 'package:partywalafinal/helpingWidgets/authenticationservices.dart';
import 'package:partywalafinal/homepage.dart';
import 'package:partywalafinal/register.dart';













class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  final AuthenticationService _auth = AuthenticationService();
  final GlobalKey<FormState> myKey=GlobalKey<FormState>();
  String email;
  String password;
  String error='';
  String y;

  @override
  Widget build(BuildContext context) {

    final screenw=MediaQuery.of(context).size.width;
    final screenh=MediaQuery.of(context).size.height;
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
            height: screenh,
            width: screenw,
            child: Image.asset("assets/yellow.jpg",fit: BoxFit.fill,),
          ),


          Positioned(
            top: 80,
            left: 30,
            right: 30,
            child: Container(

              height: 330,
              child: Container(
                margin: EdgeInsets.all(20),
                child: Form(
                  key: myKey,

                  child: ListView(
                    children: <Widget>[
                      ClipRRect(borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(
                                20) //                 <--- border radius here
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            color: Colors.amber[400],
                          ),

                          child: TextFormField(
                            decoration:InputDecoration(hintText: "Email Address",contentPadding: EdgeInsets.all(10)),
                            validator: (String value){
                              if(value.isEmpty){
                                return "plz enter the email";
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              setState(() {
                                email=value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      ClipRRect(borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(
                                20) //                 <--- border radius here
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            color: Colors.amber[400],
                          ),

                          child: TextFormField(
                            obscureText: true,
                            decoration:InputDecoration(hintText: "Password",contentPadding: EdgeInsets.all(10)),
                            validator: (String value){
                              if(value.isEmpty){
                                return "Password is required";
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              setState(() {
                                password=value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(error,style: TextStyle(color: Colors.amber),)


                    ],
                  ),
                ),
              ),

              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 4.0,


                    )
                  ]
              ),

            ),
          ),
          Positioned(
            top: screenh-470,
            left: 60,


            child: Row( mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                GestureDetector(
                  onTap: ()  async {
                    myKey.currentState.save();
                    if(myKey.currentState.validate()){
                      dynamic result= await _auth.signWithEmailaPassword(email, password);


                      if(result==null){
                        setState(() {
                          error="THE GIVEN CREDENTIALS DOES NOT MATCH WITH OUR DATABASE VALUES";
                        });
                      }
                    }

                  },

                  child: Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2.0,
                            spreadRadius: 2.0,


                          )
                        ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.orange[800],
                        child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 70,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                  },

                  child: Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(

                            blurRadius: 2.0,
                            spreadRadius: 2.0,


                          )
                        ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.orange[800],
                        child: Center(child: Text("REGISTER",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),

          Positioned(
              top: screenh-370,
              left: 90,
              child: GestureDetector(
                onTap: (){ _auth.comeInWithGoogle().whenComplete(
                        ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PartyWala()) ));

                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),

                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.white,
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Image.asset("assets/google.png"),
                        SizedBox(width: 10,),
                        Text("SIGN IN WITH GOOGLE"),
                      ],
                    ),
                  ),
                ),
              )
          )


        ],
      ),
    );
  }
}
