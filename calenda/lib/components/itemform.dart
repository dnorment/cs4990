import 'package:calenda/components/group.dart';
import 'package:calenda/components/item.dart';
import 'package:flutter/material.dart';

class ItemForm extends StatefulWidget {
  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _groupEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("New Item"),
      content: Form(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _titleEditingController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Title',
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _groupEditingController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Group',
                  ),
                ),
              ),
            ]),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Add"),
          onPressed: () {
            Item item = Item(
                title: _titleEditingController.text,
                group: Group(name: _groupEditingController.text),
            );
            Navigator.pop(context, item);
          },
        ),
      ],
    );
  }
}
