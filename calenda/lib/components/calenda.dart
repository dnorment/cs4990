import 'package:calenda/components/group.dart';
import 'package:calenda/components/item.dart';
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

  static Calenda of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Calenda>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
