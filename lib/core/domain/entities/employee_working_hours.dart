import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/common/time_of_day.dart';
import 'package:time_machine/time_machine.dart';
import 'package:time_machine/time_machine_text_patterns.dart';

class EmployeeWorkingHours extends Equatable {
  final int employee;
  final TimeOfDay? start;
  final TimeOfDay? end;
  final DateTime date;
  final int? branch;

  EmployeeWorkingHours(
      {required this.employee,
      required this.start,
      required this.end,
      required this.branch,
      required this.date});

  @override
  List<Object?> get props => [employee, start, end, branch];

  factory EmployeeWorkingHours.fromJson(Map<String, dynamic> json) {
    // 18:00:00
    var start = json['start'] != null ? TimeOfDayExtension.fromString(json['start']) : null;
    var end = json['end'] != null ? TimeOfDayExtension.fromString(json['end']) : null;
    var date = DateTime.parse(json['date']);

    return EmployeeWorkingHours(
      employee: json['employee'],
      start: start,
      end: end,
      branch: json['branch'],
      date: date,
    );
  }

  Map<String, dynamic> toJson() {

    var start = this.start != null ? date.startOfDay.add(Duration(hours: this.start!.hour, minutes: this.start!.minute)) : null;
    var end = this.end != null ? date.startOfDay.add(Duration(hours: this.end!.hour, minutes: this.end!.minute)) : null;

    return {
      'employee': employee,
      'start': start?.toUtc().toString(),
      'end': end?.toUtc().toString(),
      'branch': branch,
      'date': date.toString(),
    };
  }
}
