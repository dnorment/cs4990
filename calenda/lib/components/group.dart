import 'package:flutter/material.dart';

class Group {
  Group({
    @required this.name,
  });

  static final Group NONE = Group(name: "None");
  final String name;
}