import 'package:calenda/components/calenda.dart';
import 'package:calenda/components/group.dart';
import 'package:calenda/components/item.dart';
import 'package:calenda/components/itemform.dart';
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
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ItemForm();
            },
            barrierDismissible: true,
          ).then((item) {
            if (item != null) {
              setState(() {
                items.add(item);
              });
            }
          });
        },
      ),
      body: Container(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemTile(
              item: items[index],
              onTileButtonPressed: () {
                setState(() {
                  items.removeAt(index);
                });
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 8,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
