import 'package:calenda/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/calenda.dart';
import 'login.dart';

void main() => runApp(Calenda(child: CalendaApp()));

class CalendaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calenda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
            if (snapshot.hasData){
                Calenda.of(context).user = snapshot.data;
                return CalendaHome();
            }
              return LoginPage();
          }
      ),
    );
  }
}