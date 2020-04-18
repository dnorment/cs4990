import 'package:calenda/components/calenda.dart';
import 'package:flutter/material.dart';

class GroupForm extends StatefulWidget {
  @override
  _GroupFormState createState() => _GroupFormState();
}

class _GroupFormState extends State<GroupForm> {
  @override
  Widget build(BuildContext context) {
    List<String> groups = Calenda.of(context).groups;
    return AlertDialog(
      title: Text("Groups"),
      content: Form(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
            itemCount: groups.length,
            itemBuilder: (BuildContext context, int index) {
              String group = groups[index];
              return ListTile(
                title: Text(group),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      groups.remove(group);
                    });
                  },
                ),
              );
            }),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: () {
            
          },
        ),
      ],
    );
  }
}