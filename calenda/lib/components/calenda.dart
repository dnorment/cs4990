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

  void addItem(Item item) => items.add(item);

  static Calenda of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Calenda>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
