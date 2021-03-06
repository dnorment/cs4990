import 'package:calenda/components/calenda.dart';
import 'package:calenda/components/item.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarController _calendarController = CalendarController();
  Map<DateTime, List<Item>> _events = Map();
  DateTime _selectedDay = DateTime.now();
  List _selectedEvents = [];

  void _updateEvents() {
    List<Item> items = Calenda.of(context).items;
    items.forEach((Item item) {
      if (item.dueDate != null) {
        if (_events.containsKey(item.dueDate)) {
          if (!_events[item.dueDate].contains(item)) {
            _events[item.dueDate].add(item);
          }
        } else {
          _events[item.dueDate] = [item];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateEvents();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(
            calendarController: _calendarController,
            events: _events,
            onDaySelected: (day, evs) {
              setState(() {
                _selectedDay = day;
                _selectedEvents = evs;
              });
            },
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.all(4),
              itemCount: _selectedEvents.length,
              itemBuilder: (BuildContext context, int index) {
                Item item = _selectedEvents[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: item.group == "None" ? null : Text(item.group),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(
                height: 8,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}