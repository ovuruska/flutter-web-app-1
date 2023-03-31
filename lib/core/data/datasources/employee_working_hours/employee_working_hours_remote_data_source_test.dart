

import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/domain/entities/employee_working_hours.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../common/time_of_day.dart';
import 'employee_working_hours_remote_data_source.dart';

/*
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/common/time_of_day.dart';

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
    var start = json['start'] != null ? TimeOfDayExtension.fromString(json['start']) : null;
    var end = json['end'] != null ? TimeOfDayExtension.fromString(json['end']) : null;
    var date = DateTime.parse(json['date']);

    if (json['employee'] is String) {
      json['employee'] = int.parse(json['employee']);
    }

    return EmployeeWorkingHours(
      employee: json['employee'] as int,
      start: start,
      end: end,
      branch: json['branch'] as int?,
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

 */

class EmployeeWorkingHoursRemoteDataSourceTest extends EmployeeWorkingHoursRemoteDataSource{
  @override
  Future<Either<Failure, List<EmployeeWorkingHours>>> getWeeklySchedule(int id, DateTime start, DateTime end) {
    var employeeWorkingHours = <EmployeeWorkingHours>[
      EmployeeWorkingHours(
        employee: 1,
        start: TimeOfDayExtension.fromString('08:00'),
        end: TimeOfDayExtension.fromString('16:00'),
        branch: 1,
        date: DateTime.parse('2021-01-01'),
      ),
      EmployeeWorkingHours(
        employee: 1,
        start: TimeOfDayExtension.fromString('08:00'),
        end: TimeOfDayExtension.fromString('16:00'),
        branch: 1,
        date: DateTime.parse('2021-01-02'),
      ),
      EmployeeWorkingHours(
        employee: 1,
        start: TimeOfDayExtension.fromString('08:00'),
        end: TimeOfDayExtension.fromString('16:00'),
        branch: 1,
        date: DateTime.parse('2021-01-03'),
      ),
      EmployeeWorkingHours(
        employee: 1,
        start: TimeOfDayExtension.fromString('08:00'),
        end: TimeOfDayExtension.fromString('16:00'),
        branch: 1,
        date: DateTime.parse('2021-01-04'),
      ),
      EmployeeWorkingHours(
        employee: 1,
        start: TimeOfDayExtension.fromString('08:00'),
        end: TimeOfDayExtension.fromString('16:00'),
        branch: 1,
        date: DateTime.parse('2021-01-05'),
      ),
      EmployeeWorkingHours(
        employee: 1,
        start: TimeOfDayExtension.fromString('08:00'),
        end: TimeOfDayExtension.fromString('16:00'),
        branch: 1,
        date: DateTime.parse('2021-01-06'),
      ),
      EmployeeWorkingHours(
        employee: 1,
        start: TimeOfDayExtension.fromString('08:00'),
        end: TimeOfDayExtension.fromString('16:00'),
        branch: 1,
        date: DateTime.parse('2021-01-07'),
      ),
    ];

    return Future.value(Right(
      employeeWorkingHours
    ));
  }

  @override
  Future<Either<Failure, List<EmployeeWorkingHours>>> setWeek(List<EmployeeWorkingHours> employeeWorkingHours) {
    return Future.value(Right(
      employeeWorkingHours
    ));
  }

}