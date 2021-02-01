import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:partywalafinal/helpingWidgets/authenticationservices.dart';
import 'package:partywalafinal/wrapper.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:partywalafinal/scopemodel/scopedmodelofparty.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider.value(
    value: AuthenticationService().user,
    child: ScopedModel<PartyModel>(
      model: PartyModel(),
        child: MaterialApp(debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/':(context)=>Wrapper(),
          },


        )),
  ));
}

