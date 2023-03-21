

import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/entities/branch_id_and_name.dart';


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
  final BranchIdAndName? branch;

  AppointmentScheduleHeaderEventSetBranch({
    required this.branch,
  });

  @override
  List<Object> get props => [branch ?? -1];
}