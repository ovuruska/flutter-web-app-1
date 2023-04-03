import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/daily_slot.dart';

class AvailableBranchSlotsEvent extends Equatable {
  const AvailableBranchSlotsEvent();

  @override
  List<Object> get props => [];
}

class AvailableBranchSlotsEventLoad extends AvailableBranchSlotsEvent {
  final List<DailySlotEntity> slots;

  const AvailableBranchSlotsEventLoad({required this.slots});

  @override
  List<Object> get props => [slots];
}

class AvailableBranchSlotsEventClear extends AvailableBranchSlotsEvent {}

class AvailableBranchSlotsEventFetch extends AvailableBranchSlotsEvent {
  final DateTime start;
  final List<int> branches;
  final String service;
  final List<int> employees;

  const AvailableBranchSlotsEventFetch({
    required this.start,
    required this.branches,
    required this.service,
    required this.employees,
  });

  @override
  List<Object> get props => [start, branches, service, employees];
}