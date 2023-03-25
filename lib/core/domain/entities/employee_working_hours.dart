import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:time_machine/time_machine.dart';

class EmployeeWorkingHours extends Equatable {
  final int employee;
  final TimeOfDay start;
  final TimeOfDay end;
  final DateTime date;
  final int branch;

  EmployeeWorkingHours(
      {required this.employee,
      required this.start,
      required this.end,
      required this.branch,
      required this.date});

  @override
  List<Object?> get props => [employee, start, end, branch];

  factory EmployeeWorkingHours.fromJson(Map<String, dynamic> json) {
    var start = DateTime.parse(json['start']);
    var end = DateTime.parse(json['end']);

    var date = start.startOfDay;

    return EmployeeWorkingHours(
      employee: json['employee'],
      start: TimeOfDay(hour: start.hour, minute: start.minute),
      end: TimeOfDay(hour: end.hour, minute: end.minute),
      branch: json['branch'],
      date: date,
    );
  }

  Map<String, dynamic> toJson() {

    var start = date.add(Duration(hours: this.start.hour, minutes: this.start.minute));
    var end = date.add(Duration(hours: this.end.hour, minutes: this.end.minute));

    return {
      'employee': employee,
      'start': start.toUtc().toString(),
      'end': end.toUtc().toString(),
      'branch': branch,
      'date': date.toString(),
    };
  }
}
