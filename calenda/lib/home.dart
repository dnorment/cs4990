import 'package:calenda/screens/agenda.dart';
import 'package:calenda/screens/calendar.dart';
import 'package:calenda/screens/todo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Calenda extends InheritedWidget {
  const Calenda({
    Key key,
    @required this.user,
    @required Widget child,
  }) : super(key: key, child: child);

  final FirebaseUser user;

  static Calenda of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Calenda>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class CalendaHome extends StatefulWidget {
  @override
  _CalendaHomeState createState() => _CalendaHomeState();
}

class _CalendaHomeState extends State<CalendaHome> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    CalendarScreen(),
    ToDoScreen(),
    AgendaScreen(),
  ];
  final List<String> _titles = [
    "Calendar",
    "To-do",
    "Agenda",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_titles[_currentIndex]),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text(""),
          ),
        ],
      ),
    );
  }
}
