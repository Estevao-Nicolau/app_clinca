import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    addAppointments();
    _events = MeetingDataSource(_shiftCollection!);
    super.initState();
  }

  MeetingDataSource? _events;
  List<Appointment>? _shiftCollection;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCalendar(
      view: CalendarView.day,
      firstDayOfWeek: 1,
      timeSlotViewSettings:
          const TimeSlotViewSettings(startHour: 9, endHour: 18),
      dataSource: _events,
    )));
  }

  void addAppointments() {
    var subjectCollection = [
      'Nicolas',
      'Pedro',
      'Joao',
      'Lucas',
      'Maria',
      'Juana',
      'Isa',
      'Ana'
    ];

    var colorCollection = [
      const Color(0xFF0F8644),
      const Color.fromARGB(255, 195, 236, 10),
      const Color.fromARGB(255, 15, 15, 134),
      const Color.fromARGB(255, 244, 33, 9),
      const Color.fromARGB(255, 233, 219, 16),
      const Color.fromARGB(255, 196, 8, 8),
      const Color.fromARGB(255, 208, 17, 238),
    ];

    _shiftCollection = <Appointment>[];

    for (int j = 0; j < 365; j++) {
      for (int k = 0; k < 2; k++) {
        final DateTime date = DateTime.now().add(Duration(days: j + k));
        int startHour = 9 + Random().nextInt(6);
        startHour =
            startHour >= 13 && startHour <= 14 ? startHour + 1 : startHour;
        final DateTime shiftStartTime =
            DateTime(date.year, date.month, date.day, startHour, 0, 0);
        _shiftCollection?.add(Appointment(
            startTime: shiftStartTime,
            endTime: shiftStartTime.add(const Duration(hours: 1)),
            subject: subjectCollection[Random().nextInt(8)],
            // color: colorCollection[Random().nextInt(8)],
            startTimeZone: '',
            endTimeZone: ''));
      }
    }
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> shiftCollection) {
    appointments = shiftCollection;
  }
}
