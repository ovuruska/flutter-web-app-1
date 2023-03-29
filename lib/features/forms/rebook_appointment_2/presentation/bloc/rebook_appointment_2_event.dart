import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';

import '../../../../../core/domain/entities/branch_entity.dart';
import '../../../../../core/domain/entities/client_entity.dart';

class RebookAppointment2Event extends Equatable {
  const RebookAppointment2Event();

  @override
  List<Object> get props => [];
}

class RebookAppointment2EventSet extends RebookAppointment2Event {
  final DateTime? startDate;
  final List<EmployeeEntity> groomers;
  final List<BranchEntity> branches;
  final String service;
  final int duration;
  final ClientEntity? client;

  RebookAppointment2EventSet(
      {this.groomers = const [],
      this.branches = const [],
      this.service = 'Full Grooming',
      this.duration = 60,
      this.startDate,
      this.client});

  @override
  List<Object> get props =>
      [groomers, branches, service, duration, startDate ?? ""];
}
