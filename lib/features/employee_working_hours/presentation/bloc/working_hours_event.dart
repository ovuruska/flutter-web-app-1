import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:scrubbers_employee_application/features/employee_working_hours/domain/entities/daily_schedule_entity.dart';

import '../../domain/entities/interval_entity.dart';

class EmployeeWorkingHoursEvent extends Equatable {
  const EmployeeWorkingHoursEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeeWorkingHoursEvent extends EmployeeWorkingHoursEvent {
  final int id;
  final IntervalEntity interval;
  const GetEmployeeWorkingHoursEvent({required this.id,required this.interval});

  @override
  List<Object> get props => [id];
}

class SetEmployeeEvent extends EmployeeWorkingHoursEvent {
  final int id;
  const SetEmployeeEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class ClearWorkingHoursEvent extends EmployeeWorkingHoursEvent {
  final int id;

  const ClearWorkingHoursEvent({
    required this.id,
});

  @override
  List<Object> get props => [id];
}

class UpsertWorkingHoursEvent extends EmployeeWorkingHoursEvent {
  final List<DailyScheduleEntity> workingHours;
  final int id;

  const UpsertWorkingHoursEvent({
    required this.id,
    required this.workingHours,
  });

  @override
  List<Object> get props => workingHours;
}

class PurgeWorkingHoursEvent extends EmployeeWorkingHoursEvent {


}