import 'package:calenda/components/item.dart';
import 'package:flutter/material.dart';

import 'calenda.dart';

class ItemForm extends StatefulWidget {
  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _dateTextEditingController = TextEditingController();
  DateTime _selectedDate;
  String _selectedGroup = "None";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("New Item"),
      content: Form(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Title: "),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: _titleEditingController,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Date: "),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _dateTextEditingController,
                      enabled: false,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      child: Text("Pick Date"),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:
                              DateTime.now().subtract(Duration(days: 365)),
                          lastDate: DateTime.now().add(Duration(days: 3650)),
                        ).then((DateTime date) {
                          if (date != null) {
                            _selectedDate = date;
                            setState(() {
                              _dateTextEditingController.text =
                                  date.toString().substring(0, 10);
                            });
                          }
                        });
                        ;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Group: "),
                  ),
                  Expanded(
                    flex: 3,
                    child: DropdownButton<String>(
                      value: _selectedGroup,
                      icon: Icon(Icons.arrow_drop_down),
                      underline: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      onChanged: (newGroup) {
                        setState(() {
                          _selectedGroup = newGroup;
                        });
                      },
                      items: Calenda.of(context)
                          .groups
                          .map<DropdownMenuItem<String>>((group) {
                        return DropdownMenuItem<String>(
                          value: group,
                          child: Text(group),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      child: Text("New Group"), //TODO
                      onPressed: () {

                      },
                    ),
                  ),
                ],
              ),
            ]),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Add"),
          onPressed: () {
            Item item = Item(
              title: _titleEditingController.text,
              dueDate: _selectedDate,
              group: _selectedGroup,
            );
            Navigator.pop(context, item);
          },
        ),
      ],
    );
  }
}
