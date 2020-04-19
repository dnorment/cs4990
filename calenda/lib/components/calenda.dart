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
  List<String> groups = ["None"];

  void syncUpload() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref = ref.child("users/${user.uid}");

    Map<String, dynamic> json = {
      "groups" : groups,
      "items" : items.map((Item item) {
          return item.toJson();
        }).toList(),
    };

    ref.set(json).catchError((err) {
      print(err);
    });
  }

  void syncDownload() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref = ref.child("users/${user.uid}");

    DatabaseReference groupsRef = ref.child("/groups");
    DatabaseReference itemsRef = ref.child("/items");

    groupsRef.once().then((DataSnapshot ds) {
      groups = ["None"];

      var val = jsonDecode(jsonEncode(ds.value));
      val.forEach((group) {
        if (!groups.contains(group)) groups.add(group);
      });
    }).catchError((err) {
      print(err);
    });

    itemsRef.once().then((DataSnapshot ds) {
      items = [];

      var val = jsonDecode(jsonEncode(ds.value));
      val.forEach((item) {
        items.add(Item.fromJson(item));
      });
    }).catchError((err) {
      print(err);
    });
  }

  static Calenda of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Calenda>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
