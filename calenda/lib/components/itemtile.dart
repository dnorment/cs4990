import 'package:calenda/components/item.dart';
import 'package:flutter/material.dart';

import 'group.dart';

class ItemTile extends ListTile {
  ItemTile({
    Key key,
    @required this.item,
    @required this.onTileButtonPressed,
  }) : super(key: key);

  final Item item;
  final Function onTileButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.check_box_outline_blank),
        onPressed: onTileButtonPressed,
      ),
      title: Text(item.title),
      subtitle: item.group == Group.NONE ? null : Text(item.group.name),
    );
  }
}