import 'dart:convert';

import 'package:calenda/components/item.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Calenda extends InheritedWidget {
  Calenda({
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);

  FirebaseUser user;
  List<Item> items = [];
  List<String> groups = ["None", "CS101", "CS4990"];

  void syncUpload() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref = ref.child("users/${user.uid}");

    Map<String, dynamic> json = {
      "groups" : jsonEncode(groups),
      "items" : jsonEncode(items),
    };

    ref.set(json).catchError((err) {
      print(err);
    });
  }

  static Calenda of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Calenda>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
