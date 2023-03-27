


import 'package:equatable/equatable.dart';

import 'branch_entity.dart';
import 'employee_entity.dart';

class AppointmentSlotEntity extends Equatable {
  final DateTime start;
  final DateTime end;
  final EmployeeEntity employee;
  final BranchEntity branch;

  AppointmentSlotEntity({
    required this.start,
    required this.end,
    required this.employee,
    required this.branch,
  });

  @override
  List<Object?> get props => [start, end,  employee, branch];

  factory AppointmentSlotEntity.fromJson(Map<String, dynamic> json) {
    return AppointmentSlotEntity(
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      employee: EmployeeEntity.fromJson(json['employee']),
      branch: BranchEntity.fromJson(json['branch']),
    );
  }

  Map<String,dynamic> toJson() => {
    'start': start.toUtc().toIso8601String(),
    'end': end.toUtc().toIso8601String(),
    'employee': employee.toJson(),
    'branch': branch.toJson(),
  };
}