

import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/appointment.dart';

class TicketInformationPriorAppointmentsState extends Equatable{
  @override
  List<Object?> get props => [];

}

class TicketInformationPriorAppointmentsStateLoaded extends TicketInformationPriorAppointmentsState{
  final List<AppointmentEntity> appointments;

  TicketInformationPriorAppointmentsStateLoaded({
    required this.appointments
  });

  @override
  List<Object?> get props => [appointments];
}

class TicketInformationPriorAppointmentsStateLoading extends TicketInformationPriorAppointmentsState{}

class TicketInformationPriorAppointmentsStateError extends TicketInformationPriorAppointmentsState{}