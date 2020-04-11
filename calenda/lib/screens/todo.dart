import 'package:calenda/components/calenda.dart';
import 'package:calenda/components/group.dart';
import 'package:calenda/components/item.dart';
import 'package:calenda/components/itemtile.dart';
import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    List<Item> items = Calenda.of(context).items;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            Group g = Group(name: "CS4990");
            Item i = Item(title: "APP");
            i.group = g;
            items.add(i);
          });
        },
      ),
      body: Card(
        child: Container(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemTile(item: items[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 5),
          ),
        ),
      ),
    );
  }
}
