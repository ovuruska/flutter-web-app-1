
import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {

  /// Returns the number of minutes since midnight for this time of day.
  get inMinutes => hour * 60 + minute;

  /// Returns true if this time of day is before the given [other] time of day.
  bool isBefore(TimeOfDay other) => inMinutes < other.inMinutes;

  /// Returns true if this time of day is after the given [other] time of day.
  bool isAfter(TimeOfDay other) => inMinutes > other.inMinutes;

  /// Adds the given [duration] to this time of day.
  ///
  TimeOfDay add(Duration duration) {
    var minutes = inMinutes + duration.inMinutes;
    var hour = minutes ~/ 60;
    var minute = minutes % 60;
    return TimeOfDay(hour: hour, minute: minute);
  }

  // Parse 18:00:00
  static TimeOfDay fromString(String time) {
    var parts = time.split(':');
    var hour = int.parse(parts[0]);
    var minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

}