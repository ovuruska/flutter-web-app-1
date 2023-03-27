

import 'package:equatable/equatable.dart';

import 'appointment.dart';
import 'employee_entity.dart';

class BranchDailyInformationEntity extends Equatable{
  final List<EmployeeEntity> employees;
  final List<AppointmentEntity> appointments;

  BranchDailyInformationEntity({
    this.employees = const [],
    this.appointments = const [],
  });

  @override
  List<Object> get props => [employees, appointments];

  factory BranchDailyInformationEntity.fromJson(Map<String, dynamic> json) {
    return BranchDailyInformationEntity(
      employees: (json['employees'] as List<dynamic>).map<EmployeeEntity>((e) => EmployeeEntity.fromJson(e)).toList(),
      appointments: (json['appointments'] as List<dynamic>).map<AppointmentEntity>((e) => AppointmentEntity.fromJson(e)).toList(),
    );
  }
}