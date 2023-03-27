import 'package:equatable/equatable.dart';

import '../../domain/entities/daily_schedule_entity.dart';
import '../../domain/entities/interval_entity.dart';

class EmployeeWorkingHoursEvent extends Equatable {
  const EmployeeWorkingHoursEvent();

  @override
  List<Object> get props => [];
}

class EmployeeWorkingHoursEventGet extends EmployeeWorkingHoursEvent {
  final int id;
  final IntervalEntity interval;
  const EmployeeWorkingHoursEventGet({required this.id,required this.interval});

  @override
  List<Object> get props => [id];
}

class EmployeeWorkingHoursEventSetEmployee extends EmployeeWorkingHoursEvent {
  final int id;
  const EmployeeWorkingHoursEventSetEmployee({required this.id});

  @override
  List<Object> get props => [id];
}

class EmployeeWorkingHoursEventClear extends EmployeeWorkingHoursEvent {
  final int id;

  const EmployeeWorkingHoursEventClear({
    required this.id,
});

  @override
  List<Object> get props => [id];
}

class EmployeeWorkingHoursEventUpsert extends EmployeeWorkingHoursEvent {
  final List<DailyScheduleEntity> workingHours;
  final int id;

  const EmployeeWorkingHoursEventUpsert({
    required this.id,
    required this.workingHours,
  });

  @override
  List<Object> get props => workingHours;
}

class EmployeeWorkingHoursEventPurge extends EmployeeWorkingHoursEvent {


}