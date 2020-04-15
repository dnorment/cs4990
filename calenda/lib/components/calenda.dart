import 'package:calenda/components/group.dart';
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
  List<Group> groups = [];

  Group getGroupOrAddNew(String name) {
    return groups.firstWhere(
      (group) => name == group.name,
      orElse:() {
        Group newGroup = Group(name: name);
        groups.add(newGroup);
        return newGroup;
      }
    );
  }

  void syncUpload() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref = ref.child("users/${user.uid}");
    Map<String, dynamic> json = {
      "items" : items.map((Item item) {
        return {
          "title" : item.title,
          "group" : item.group.name,
          "dueDate" : item.dueDate.toString(),
        };
      }).toList(),
      "groups" : groups.map((Group group) {
        return {
          "name" : group.name,
        };
      }).toList(),
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
