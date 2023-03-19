extension DateUtils on DateTime {
  DateTime startOfWeek() {
    var day = weekday;
    var diff = day - DateTime.monday;
    var startDay = subtract(Duration(days: diff));
    return DateTime(startDay.year, startDay.month, startDay.day, 0, 0, 0, 0, 0);
  }

  DateTime endOfWeek(){
    var day = weekday;
    var diff = DateTime.sunday - day;
    var endDay = add(Duration(days: diff));
    return DateTime(endDay.year, endDay.month, endDay.day, 23, 59, 59, 999, 999);
  }

  bool isSameWeek(DateTime other) {
    var newDateWeekDay = other.weekday;
    var weekDayDifference = newDateWeekDay - weekday;
    var dayDifference = other.difference(this).inDays;
    return weekDayDifference == dayDifference;
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  DateTime get startOfDay => DateTime(year, month, day);

  DateTime get endOfDay => DateTime(year, month, day, 23, 59);
}
