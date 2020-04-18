import 'package:calenda/components/calenda.dart';
import 'package:flutter/material.dart';

class GroupForm extends StatefulWidget {
  @override
  _GroupFormState createState() => _GroupFormState();
}

class _GroupFormState extends State<GroupForm> {
  TextEditingController _groupNameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> groups = Calenda.of(context).groups.skip(1).toList();
    return AlertDialog(
      title: Text("Groups"),
      content: Form(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: <Widget>[
              Expanded(
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
                            Calenda.of(context).groups.remove(group);
                          });
                          Calenda.of(context).syncUpload();
                        },
                      ),
                    );
                  }),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Add: "),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _groupNameEditingController,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      child: Text("New"),
                      onPressed: () {
                        setState(() {
                          Calenda.of(context).groups.add(_groupNameEditingController.text);
                        });
                        Calenda.of(context).syncUpload();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
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