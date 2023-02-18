import 'dart:convert';

import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';

import 'EmployeeShallow.dart';

class EmployeeWorkingDay {
  final Branch? branch;
  final DateTime date;
  final DateTime? start;
  final DateTime? end;

  EmployeeWorkingDay({required this.date, this.start,this.end, required this.branch});

  factory EmployeeWorkingDay.fromJson(Map<String, dynamic> json) {
    var date = DateTime.parse(json['date']);
    var start = null;
    var end = null;
    if(json["start"] != null){
      var startDecoded = DateTime.parse(json['start']);
      start = DateTime(date.year, date.month, date.day, startDecoded.hour, startDecoded.minute);

    }
    if(json["end"] != null){
      var endDecoded = DateTime.parse(json['end']);
      end = DateTime(date.year, date.month, date.day, endDecoded.hour, endDecoded.minute);
    }

    return EmployeeWorkingDay(
      date:date,
      start: start,
      end: end,
      branch: json['branch'] == null ? null : Branch.fromJson(json['branch']),

    );
  }

  toJson() {
    return {
      'date': date.toIso8601String(),
      'start': start?.toIso8601String(),
      'end': end?.toIso8601String(),
      'branch': (branch != null) ? branch!.toJson() : null,
    };
  }
}

class EmployeeWorkingHours {
  final EmployeeShallow employee;
  final DateTime start;
  final DateTime end;
  List<EmployeeWorkingDay> workingDays;

  EmployeeWorkingHours(
      {required this.employee, required this.start,required this.end, required this.workingDays});

  factory EmployeeWorkingHours.fromJson(Map<String, dynamic> json) {
    return EmployeeWorkingHours(
        employee: EmployeeShallow.fromJson(json['employee']),
        start: DateTime.parse(json['start']),
        end: DateTime.parse(json['end']),
        workingDays: json['working_hours']
            .map<EmployeeWorkingDay>((e) => EmployeeWorkingDay.fromJson(e))
            .toList());
  }

  toJson() {
    return {
      'employee': employee.toJson(),
      'start': start.toIso8601String(),
      'end': end.toIso8601String(),
      'working_hours': workingDays.map((e) => e.toJson()).toList(),
    };
  }

}
