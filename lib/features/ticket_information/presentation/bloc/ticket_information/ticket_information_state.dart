

import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';

class TicketInformationState extends Equatable{
  @override
  List<Object?> get props => [];

}

class TicketInformationStateLoaded extends TicketInformationState{
  final AppointmentEntity appointment;

  TicketInformationStateLoaded({
    required this.appointment
  });

  @override
  List<Object?> get props => [appointment];
}

class TicketInformationStateLoading extends TicketInformationState{}

class TicketInformationStateError extends TicketInformationState{}