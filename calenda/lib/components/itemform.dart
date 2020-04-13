import 'package:calenda/components/group.dart';
import 'package:calenda/components/item.dart';
import 'package:calenda/components/systempadding.dart';
import 'package:flutter/material.dart';

import 'calenda.dart';

class ItemForm extends StatefulWidget {
  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  TextEditingController _titleEditingController = TextEditingController();
  Group selectedGroup = Group.NONE;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("New Item"),
      content: Form(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SystemPadding(
                child: TextField(
                  autofocus: true,
                  controller: _titleEditingController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Title',
                  ),
                ),
              ),
              DropdownButton<Group>(
                  value: selectedGroup,
                  icon: Icon(Icons.arrow_drop_down),
                  underline: Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  onChanged: (Group newGroup) {
                    setState(() {
                      selectedGroup = newGroup;
                    });
                  },
                  items: Calenda.of(context)
                      .groups
                      .map<DropdownMenuItem<Group>>((Group group) {
                    return DropdownMenuItem<Group>(
                      value: group,
                      child: Text(group.name),
                    );
                  })
                  .toList(),
                ),
            ]),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Add"),
          onPressed: () {
            Item item = Item(
              title: _titleEditingController.text,
              group: selectedGroup,
            );
            Navigator.pop(context, item);
          },
        ),
      ],
    );
  }
}
