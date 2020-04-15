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
      home: LoginPage(),
    );
  }
}