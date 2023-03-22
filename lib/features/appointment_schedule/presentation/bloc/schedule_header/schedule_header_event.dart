

import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/branch_entity.dart';


class AppointmentScheduleHeaderEvent extends Equatable {
  const AppointmentScheduleHeaderEvent();

  @override
  List<Object> get props => [];
}

class AppointmentScheduleHeaderEventSetDate extends AppointmentScheduleHeaderEvent{
  final DateTime date;

  AppointmentScheduleHeaderEventSetDate({
    required this.date,
  });

  @override
  List<Object> get props => [date];
}

class AppointmentScheduleHeaderEventSetBranch extends AppointmentScheduleHeaderEvent{
  final BranchEntity? branch;

  AppointmentScheduleHeaderEventSetBranch({
    required this.branch,
  });

  @override
  List<Object> get props => [branch ?? -1];
}