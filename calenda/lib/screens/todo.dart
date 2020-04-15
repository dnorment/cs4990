import 'package:calenda/components/calenda.dart';
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
          showDialog<Item>(
            context: context,
            child: ItemForm(),
            barrierDismissible: true,
          ).then((Item item) {
            if (item != null) {
              setState(() {
                items.add(item);
              });
              Calenda.of(context).syncUpload();
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
                Calenda.of(context).syncUpload();
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
