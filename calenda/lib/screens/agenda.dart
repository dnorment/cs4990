import 'package:calenda/components/calenda.dart';
import 'package:calenda/components/item.dart';
import 'package:calenda/components/timeline.dart';
import 'package:flutter/material.dart';

class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  List<Widget> _getTiles() {
    List<Item> items = List<Item>.from(Calenda.of(context).items);
    items.sort((i1, i2) {
      if (i1.dueDate != null && i2.dueDate != null) {
        return i1.dueDate.compareTo(i2.dueDate);
      } else {
        return 0;
      }
    });
    return items.map((Item item) {
      return ListTile(
        title: Text(item.title),
        subtitle: item.group == "None" ? null : Text(item.group),
        trailing: item.dueDate != null ?
          Text("${item.dueDate.month}/${item.dueDate.day}",
            textAlign: TextAlign.right,
          ) : Text(""),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> tiles = _getTiles();
    return Timeline(
      children: tiles ?? [],
    );
  }
}
