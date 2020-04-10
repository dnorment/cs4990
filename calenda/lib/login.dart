import 'package:flutter/material.dart';
import 'package:calenda/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(CalendaApp());

class CalendaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calenda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white,
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _msgToUser = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/loginBackground.png"),
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 6,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Please log in:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextField(
                                        controller: _emailEditingController,
                                        obscureText: false,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Email',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextField(
                                        controller: _passwordEditingController,
                                        obscureText: true,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Password',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 8, 0, 32),
                                      child: Text(
                                        '$_msgToUser',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(50, 4, 50, 4),
                      child: Text("Log in"),
                      onPressed: () {
                        Future<AuthResult> res =
                            _auth.signInWithEmailAndPassword(
                          email: _emailEditingController.text.toString(),
                          password: _passwordEditingController.text.toString(),
                        );

                        res.then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calenda(
                                    user: value.user,
                                    child: CalendaHome(),
                                  )));
                        }).catchError((err) {
                          if (err.toString().contains("ERROR_WRONG_PASSWORD") ||
                              err.toString().contains("ERROR_USER_NOT_FOUND")) {
                            setState(() {
                              _msgToUser = "Incorrect email or password.";
                            });
                          }
                          print(err.toString());
                        });
                      },
                    ),
                    FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(50, 4, 50, 4),
                      child: Text("Sign up"),
                      onPressed: () {
                        Future<AuthResult> res =
                            _auth.createUserWithEmailAndPassword(
                          email: _emailEditingController.text.toString(),
                          password: _passwordEditingController.text.toString(),
                        );

                        res.then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calenda(
                                        user: value.user,
                                        child: CalendaHome(),
                                      )));
                        }).catchError((err) {
                          if (err
                              .toString()
                              .contains("ERROR_EMAIL_ALREADY_IN_USE")) {
                            setState(() {
                              _msgToUser =
                                  "Specified email address is already in use by another account.";
                            });
                          } else if (err
                              .toString()
                              .contains("ERROR_WEAK_PASSWORD")) {
                            setState(() {
                              _msgToUser =
                                  "Given password is too weak (minimum 6 characters).";
                            });
                          }
                          print(err.toString());
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
