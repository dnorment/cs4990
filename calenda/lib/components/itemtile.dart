import 'package:calenda/components/item.dart';
import 'package:flutter/material.dart';

import 'group.dart';

class ItemTile extends ListTile {
  ItemTile({
    Key key,
    @required this.item
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.group.name),
    );
  }
}