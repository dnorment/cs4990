import 'package:flutter/material.dart';

class Item {
  Item({this.title});

  String title;

  ListTile toTile() {
    return ListTile(
      title: Text(title),
    );
  }
}