import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/interval.dart';

import '../../domain/entities/branch_schedule_entity.dart';

class BranchWorkingHoursEvent extends Equatable {
  const BranchWorkingHoursEvent();

  @override
  List<Object> get props => [];
}

class BranchWorkingHoursEventGet extends BranchWorkingHoursEvent {
  final int id;
  final IntervalEntity interval;
  const BranchWorkingHoursEventGet({required this.id,required this.interval});

  @override
  List<Object> get props => [id];
}

class BranchWorkingHoursEventSetBranch extends BranchWorkingHoursEvent {
  final int id;
  const BranchWorkingHoursEventSetBranch({required this.id});

  @override
  List<Object> get props => [id];
}

class BranchWorkingHoursEventClear extends BranchWorkingHoursEvent {
  final int id;

  const BranchWorkingHoursEventClear({
    required this.id,
});

  @override
  List<Object> get props => [id];
}

class BranchWorkingHoursEventUpsert extends BranchWorkingHoursEvent {
  final List<BranchScheduleEntity> workingHours;
  final int id;

  const BranchWorkingHoursEventUpsert({
    required this.id,
    required this.workingHours,
  });

  @override
  List<Object> get props => workingHours;
}

class BranchWorkingHoursEventPurge extends BranchWorkingHoursEvent {


}