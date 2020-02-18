import 'package:flutter/material.dart';

void main() => runApp(Calenda());

class Calenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calenda',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Text("Welcome"),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                color: Colors.blueAccent[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(4),
                      child: Text("Continue with Google"),
                      onPressed: () {},
                    ),
                    FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(4),
                      child: Text("Save Data Locally"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
