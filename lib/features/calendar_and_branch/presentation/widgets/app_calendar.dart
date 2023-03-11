import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_header.dart';

class AppCalendar extends StatefulWidget {
  final DateTime? initialDate;
  final void Function(DateTime)? onDateSelected;

  const AppCalendar({Key? key, this.initialDate, this.onDateSelected}) : super(key: key);

  @override
  _AppCalendarState createState() => _AppCalendarState();
}

class _AppCalendarState extends State<AppCalendar> {
  late DateTime focusedDay;

  @override
  void initState() {
    super.initState();
    focusedDay = widget.initialDate ?? DateTime.now();
  }

  setDate(DateTime date) {
    setState(() {
      focusedDay = date;
    });
    if(widget.onDateSelected != null) {
      widget.onDateSelected!(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    var startOfMonth = DateTime(focusedDay.year, focusedDay.month, 1);
    var lastDayOfMonth = DateTime(focusedDay.year, focusedDay.month + 1, 0);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(children: [
          AppCalendarHeader(
              onTodayButtonTap: () => setDate(DateTime.now()),
              focusedDay: focusedDay,
              onLeftChevronTap: () => setDate(_previousMonth(focusedDay)),
              onRightChevronTap: () => setDate(_nextMonth(focusedDay))),
          TableCalendar(
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            selectedDayPredicate: (day) => isSameDay(day, focusedDay),

            headerVisible: false,
            calendarFormat: CalendarFormat.month,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                  color: const Color(0XFF494C68).withOpacity(.5),
                  fontSize: 16,
                  fontFamily: "Poppins"),
              weekendStyle: TextStyle(
                  color: const Color(0XFF494C68).withOpacity(.5),
                  fontSize: 16,
                  fontFamily: "Poppins"),
            ),
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(
                  color: const Color(0XFF494C68),
                  fontSize: 16,
                  fontFamily: "Poppins"),
            ),
            rowHeight: 48,
            focusedDay: focusedDay,

            firstDay: startOfMonth,
            lastDay: lastDayOfMonth,
            onDaySelected: (newSelectedDay, _) => setDate(newSelectedDay),
          )
        ]));
  }
}

DateTime _previousMonth(DateTime month) {
  if (month.month == 1) {
    return DateTime(month.year - 1, 12);
  } else {
    return DateTime(month.year, month.month - 1);
  }
}

DateTime _nextMonth(DateTime month) {
  if (month.month == 12) {
    return DateTime(month.year + 1, 1);
  } else {
    return DateTime(month.year, month.month + 1);
  }
}
