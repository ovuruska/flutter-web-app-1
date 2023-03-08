

import 'package:equatable/equatable.dart';

import '../../domain/entities/daily_schedule_entity.dart';

class EmployeeWorkingHoursState extends Equatable {
  @override
  List<Object?> get props => [];
}


class Empty extends EmployeeWorkingHoursState {}
class Loading extends EmployeeWorkingHoursState {}

class Initial extends EmployeeWorkingHoursState {
  final int id;
  final seed = DateTime.now();

  Initial({required this.id});

  @override
  List<Object?> get props => [id,seed];
}

class Loaded extends EmployeeWorkingHoursState {
  final List<DailyScheduleEntity> workingHours;
  final int id;

  Loaded({required this.workingHours, required this.id});

  @override
  List<Object?> get props => [id,workingHours];
}

class Failed extends EmployeeWorkingHoursState {
  final String message;

  Failed({required this.message});

  @override
  List<Object?> get props => [message];
}