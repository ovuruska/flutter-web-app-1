import 'package:equatable/equatable.dart';

import '../../../../app_select_branch/domain/entities/branch_id_and_name.dart';

class AppointmentScheduleHeaderState extends Equatable {
  final DateTime date;
  final BranchIdAndName? branch;

  const AppointmentScheduleHeaderState({
    required this.date,
    this.branch,
  });

  @override
  List<Object> get props => [branch ?? -1, date];
}
