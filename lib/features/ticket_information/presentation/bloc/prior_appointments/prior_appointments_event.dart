

import 'package:equatable/equatable.dart';

class TicketInformationPriorAppointmentsEvent extends Equatable {
  const TicketInformationPriorAppointmentsEvent();

  @override
  List<Object> get props => [];
}

class TicketInformationPriorAppointmentsEventFetch extends TicketInformationPriorAppointmentsEvent {
  final int id;

  const TicketInformationPriorAppointmentsEventFetch({required this.id});

  @override
  List<Object> get props => [id];
}