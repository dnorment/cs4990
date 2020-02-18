import 'package:flutter/material.dart';
import 'package:calenda/home.dart';

void main() => runApp(Calenda());

class Calenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calenda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      backgroundColor: Colors.blue[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: CircleAvatar(radius: 50, child: Text("Logo")),
                  ),
                  Text(
                    "Welcome to Calenda",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(40),
                        color: Colors.blueAccent[100],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Please choose a sign-in option:",
                              style: TextStyle(color: Colors.white),
                            ),
                            FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              padding: EdgeInsets.fromLTRB(50, 4, 50, 4),
                              child: Text("Continue with Google"),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendaHome()));
                              },
                            ),
                            FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              padding: EdgeInsets.fromLTRB(50, 4, 50, 4),
                              child: Text("Save Data Locally"),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendaHome()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
