

import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/branch_entity.dart';
import '../../../../../core/domain/entities/client_entity.dart';
import '../../../../../core/domain/entities/employee_entity.dart';

class RebookAppointment2State extends Equatable {
  const RebookAppointment2State();

  @override
  List<Object> get props => [];
}

class RebookAppointment2StateInitial extends RebookAppointment2State {
  final DateTime? startDate;
  final List<EmployeeEntity> groomers;
  final List<BranchEntity> branches;
  final String service;
  final int duration;
  final ClientEntity? client;


  RebookAppointment2StateInitial({
    this.groomers = const [],
    this.branches = const [],
    this.service = 'Full Grooming',
    this.duration = 60,
    this.startDate,
    this.client
  });

  @override
  List<Object> get props => [groomers, branches, service, duration, startDate??""];
}