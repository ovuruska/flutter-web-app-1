

import 'package:equatable/equatable.dart';

class DailyColumnEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class DailyColumnEventSetTarget extends DailyColumnEvent {

  final int employee;
  final DateTime date;
  final int target;
  final String employeeName;

  DailyColumnEventSetTarget({
    required this.employee,
    required this.employeeName,
    required this.date,
    required this.target,
  });

  @override
  List<Object?> get props => [employee, date, target,employeeName];
}

class DailyColumnEventPatchAppointment extends DailyColumnEvent {
  final int employee;
  final DateTime date;
  final int branch;
  final int appointment;
  final int start;
  final int end;

  DailyColumnEventPatchAppointment({
    required this.employee,
    required this.date,
    required this.branch,
    required this.appointment,
    required this.start,
    required this.end,
  });

  @override
  List<Object?> get props => [employee, date, branch, appointment, start, end];
}

