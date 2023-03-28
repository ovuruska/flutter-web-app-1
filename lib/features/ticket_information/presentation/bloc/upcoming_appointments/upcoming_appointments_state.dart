
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';

class TicketInformationUpcomingAppointmentsState extends Equatable {
  const TicketInformationUpcomingAppointmentsState();

  @override
  List<Object> get props => [];
}

class TicketInformationUpcomingAppointmentsStateLoading
    extends TicketInformationUpcomingAppointmentsState {}

class TicketInformationUpcomingAppointmentsStateError extends TicketInformationUpcomingAppointmentsState {}

class TicketInformationUpcomingAppointmentsStateLoaded extends TicketInformationUpcomingAppointmentsState {
  final List<AppointmentEntity> appointments;

  const TicketInformationUpcomingAppointmentsStateLoaded({required this.appointments});

  @override
  List<Object> get props => [appointments];
}