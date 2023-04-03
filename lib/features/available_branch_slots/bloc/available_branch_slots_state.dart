import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/daily_slot.dart';

class AvailableBranchSlotsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AvailableBranchSlotsStateInitial extends AvailableBranchSlotsState {}

class AvailableBranchSlotsStateLoading extends AvailableBranchSlotsState {}

class AvailableBranchSlotsStateError extends AvailableBranchSlotsState {
  final String message;

  AvailableBranchSlotsStateError({required this.message});

  @override
  List<Object?> get props => [message];
}

class AvailableBranchSlotsStateLoaded extends AvailableBranchSlotsState {
  final List<DailySlotEntity> slots;

  AvailableBranchSlotsStateLoaded({required this.slots});

  @override
  List<Object?> get props => [slots];
}