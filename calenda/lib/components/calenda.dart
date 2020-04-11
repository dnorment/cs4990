import 'package:calenda/components/group.dart';
import 'package:calenda/components/item.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Calenda extends InheritedWidget {
  Calenda({
    Key key,
    @required this.user,
    @required Widget child,
  }) : super(key: key, child: child);

  final FirebaseUser user;
  List<Item> items = [];
  List<Group> groups = [];

  void addItem(Item item) => items.add(item);

  void removeItem(Item item) => items.remove(item);

  static Calenda of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Calenda>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
