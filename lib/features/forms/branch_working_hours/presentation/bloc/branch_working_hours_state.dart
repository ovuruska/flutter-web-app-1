

import 'package:equatable/equatable.dart';

import '../../domain/entities/branch_schedule_entity.dart';

class BranchWorkingHoursState extends Equatable {
  @override
  List<Object?> get props => [];
}


class BranchWorkingHoursStateEmpty extends BranchWorkingHoursState {}
class BranchWorkingHoursStateLoading extends BranchWorkingHoursState {}

class BranchWorkingHoursStateInitial extends BranchWorkingHoursState {
  final int id;
  final seed = DateTime.now();

  BranchWorkingHoursStateInitial({required this.id});

  @override
  List<Object?> get props => [id,seed];
}

class BranchWorkingHoursStateLoaded extends BranchWorkingHoursState {
  final List<BranchScheduleEntity> workingHours;
  final int id;

  BranchWorkingHoursStateLoaded({required this.workingHours, required this.id});

  @override
  List<Object?> get props => [id,workingHours];
}

class BranchWorkingHoursStateFailed extends BranchWorkingHoursState {
  final String message;

  BranchWorkingHoursStateFailed({required this.message});

  @override
  List<Object?> get props => [message];
}