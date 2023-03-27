

import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';

import '../../../../core/domain/entities/branch_entity.dart';

class AvailableSlotsEvent extends Equatable {
  const AvailableSlotsEvent();

  @override
  List<Object> get props => [];
}

class AvailableSlotsEventFetch extends AvailableSlotsEvent {
  final DateTime start;
  final List<EmployeeEntity> groomers;
  final List<BranchEntity> branches;
  final String service;
  final int duration;

  AvailableSlotsEventFetch({
    required this.start,
    this.groomers = const [],
    this.branches = const [],
    required this.service,
    required this.duration,
  });

  @override
  List<Object> get props => [start, groomers, branches, service, duration];
}

