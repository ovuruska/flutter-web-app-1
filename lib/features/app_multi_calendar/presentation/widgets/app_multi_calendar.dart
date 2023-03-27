import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/features/app_calendar/domain/callbacks/calendar_set_date.dart';
import 'package:scrubbers_employee_application/features/app_calendar/domain/callbacks/calendar_week_changed.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_bloc.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_event.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/DateUtils.dart';
import '../../../../injection.dart';
import '../../domain/callbacks/calendar_set_date.dart';
import 'calendar_header.dart';

final textStyle = TextStyle(
    color: Color(0XFF494C68).withOpacity(.5),
    fontSize: 12,
    fontFamily: "Poppins");

class AppMultiCalendar extends StatelessWidget {
  final DateTime? date;
  final formatter = DateFormat('MMMM yyyy');

  AppMultiCalendar({Key? key, this.date}) : super(key: key);

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
    getItMaybe<AppMultiCalendarSetDateCallback>()?.call(date);
    sl<AppMultiCalendarBloc>().add(
      AppMultiCalendarEventSetDate(date: date),
    );
  }

  DateTime get focusedDay => date ?? DateTime.now();

  Widget _calendar(DateTime date) {
    var startOfMonth = DateTime(date.year, date.month, 1);
    var lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    return Column(children: [
      Center(
        child: Text(
          formatter.format(date),
          style: TextStyle(
              color: const Color(0XFF494C68),
              fontSize: 16,
              fontFamily: "Poppins"),
        ),
      ),
      Container(height: 16),
      TableCalendar(
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },
        startingDayOfWeek: StartingDayOfWeek.monday,
        selectedDayPredicate: (day) => isSameDay(day, focusedDay),
        headerVisible: false,
        calendarFormat: CalendarFormat.month,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: textStyle,
          weekendStyle: textStyle,
        ),
        calendarStyle: CalendarStyle(
          selectedTextStyle: textStyle.merge(
            TextStyle(color: Colors.white),
          ),
          todayTextStyle: textStyle,
          todayDecoration: BoxDecoration(
            color: const Color(0XFF90D7FF).withOpacity(.23),
            shape: BoxShape.circle,
          ),
          outsideDaysVisible: false,
          weekendTextStyle: textStyle,
          defaultTextStyle: textStyle,
        ),
        rowHeight: 24,
        focusedDay: date,
        firstDay: startOfMonth,
        lastDay: lastDayOfMonth,
        onDaySelected: (newSelectedDay, _) => setDate(newSelectedDay),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF90D7FF).withOpacity(.23),
                  offset: Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
                child: Column(children: [
              AppMultiCalendarHeader(
                  onTodayButtonTap: () => setDate(DateTime.now()),
                  focusedDay: focusedDay,
                  onLeftChevronTap: () => setDate(focusedDay.previousMonth()),
                  onRightChevronTap: () => setDate(focusedDay.nextMonth())),
              Container(height: 32),
              _calendar(focusedDay.previousMonth().previousMonth()),
              Container(height: 32),
              _calendar(focusedDay.previousMonth()),
              Container(height: 32),
              _calendar(focusedDay),
              Container(height: 32),
              _calendar(focusedDay.nextMonth()),
              Container(height: 32),
              _calendar(focusedDay.nextMonth().nextMonth()),
              Container(height: 32),
            ]))));
  }
}
