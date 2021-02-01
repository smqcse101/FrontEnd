import 'package:flutter/material.dart';
import 'package:partywalafinal/helpingWidgets/authenticationservices.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();
  String email;
  String password;
  String error = '';

  @override
  Widget build(BuildContext context) {
    final AuthenticationService _auth = AuthenticationService();


    return Scaffold(
      backgroundColor: Colors.pink[900],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.amber[500]),
        backgroundColor: Colors.pink[800],
        title: Text("Register and get logged in",style: TextStyle(color: Colors.amber[500]),),
      ),
      body: Container(

        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Form(
          key: myKey,
          child: Center(
            child: ListView(
              children: <Widget>[
                Text(error),
                SizedBox(height: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.amber[500],
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Email Address",
                          contentPadding: EdgeInsets.all(10)),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Enter the email";
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.amber[500],
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password for this app",
                          contentPadding: EdgeInsets.all(10)),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Password is required";
                        }
                        if(value.length<7){
                          return "We need a strong Password";
                        }
                        if(!value.contains(RegExp(r'[A-Z]'))){
                          return "at least one capital is required";
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        setState(() {
                          password = value;

                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.pink[500],
                      onPressed: ()  async {
                        myKey.currentState.save();
                        if (myKey.currentState.validate()) {
                          dynamic result= await _auth.regWithEmailAndPassword(email, password);
                          setState(() {

                          });
                          print(result);
                          if(result==null){
                            setState(() {
                              error="Plz apply a valid email or this email is already registered";
                            });
                          }

                        }
                      },
                      child: Text("Register",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16),),
                    ),


                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}