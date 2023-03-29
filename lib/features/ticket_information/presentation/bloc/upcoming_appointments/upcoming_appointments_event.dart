
import 'package:equatable/equatable.dart';

class TicketInformationUpcomingAppointmentsEvent extends Equatable {
  const TicketInformationUpcomingAppointmentsEvent();

  @override
  List<Object> get props => [];
}

class TicketInformationUpcomingAppointmentsEventFetch
    extends TicketInformationUpcomingAppointmentsEvent {
  final int id;

  const TicketInformationUpcomingAppointmentsEventFetch({required this.id});

  @override
  List<Object> get props => [id];
}