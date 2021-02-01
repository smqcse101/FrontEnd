import 'package:partywalafinal/homepage.dart';
import 'package:partywalafinal/loginpage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);


    // return either the Home or Authenticate widget
    if (user == null){
      return Login();
    } else {
      return PartyWala();
    }

  }
}
