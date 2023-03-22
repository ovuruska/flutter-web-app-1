import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';


class AppointmentScheduleHeaderState extends Equatable {
  final DateTime date;
  final BranchEntity? branch;

  const AppointmentScheduleHeaderState({
    required this.date,
    this.branch,
  });

  @override
  List<Object> get props => [branch ?? -1, date];
}
