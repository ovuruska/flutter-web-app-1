import 'package:equatable/equatable.dart';

import '../../../../models/Appointment.dart';
import '../../domain/entities/appointment_entity.dart';

class CreateAppointmentEvent extends Equatable {
  const CreateAppointmentEvent();

  @override
  List<Object> get props => [];
}

class PostAppointmentEvent extends CreateAppointmentEvent {
  final AppointmentEntity appointment;
  final Function(Appointment appointment)? sideEffect;

  PostAppointmentEvent({
    required this.appointment,
    required this.sideEffect,
  });

  @override
  List<Object> get props => [appointment];
}

class BranchChangedEvent extends CreateAppointmentEvent {
  final String branchId;

  const BranchChangedEvent({required this.branchId});

  @override
  List<Object> get props => [branchId];
}

class GetEmployeesEvent extends CreateAppointmentEvent {
  final int branchId;

  const GetEmployeesEvent({required this.branchId});

  @override
  List<Object> get props => [branchId];
}

class GetBranchesEvent extends CreateAppointmentEvent {
  const GetBranchesEvent();

  @override
  List<Object> get props => [];
}
