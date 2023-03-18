import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/features/app_calendar/domain/callbacks/calendar_set_date.dart';
import 'package:scrubbers_employee_application/features/app_calendar/domain/callbacks/calendar_week_changed.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../injection.dart';
import '../bloc/app_calendar_bloc.dart';
import '../bloc/app_calendar_event.dart';
import 'calendar_header.dart';

class AppCalendar extends StatelessWidget {
  final DateTime? date;

  const AppCalendar({Key? key, this.date}) : super(key: key);

  weekChanged(DateTime newDate) {
    // Check newDate and date are on the same week or not.
    // If not, then call the callback
    if (date != null) {
      var newDateWeekDay = newDate.weekday;
      var dateWeekDay = date!.weekday;
      var weekDayDifference = newDateWeekDay - dateWeekDay;
      var dayDifference = newDate.difference(date!).inDays;
      if (weekDayDifference != dayDifference) {
        getItMaybe<AppCalendarWeekChangedCallback>()?.call(newDate);
      }
    }
  }

  setDate(DateTime date) {
    weekChanged(date);
    getItMaybe<AppCalendarSetDateCallback>()?.call(date);
    sl<AppCalendarBloc>().add(
      AppCalendarSetDateEvent(date),
    );
  }

  get focusedDay => date ?? DateTime.now();

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
            startingDayOfWeek: StartingDayOfWeek.monday,
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
