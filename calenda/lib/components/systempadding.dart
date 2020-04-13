import 'package:flutter/material.dart';

class SystemPadding extends StatelessWidget {
  SystemPadding({
    Key key,
    @required this.child,
    }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      child: child,
    );
  }
}
