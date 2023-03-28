import 'package:equatable/equatable.dart';

class TicketInformationEvent extends Equatable {
  const TicketInformationEvent();

  @override
  List<Object> get props => [];
}

class TicketInformationEventFetch extends TicketInformationEvent {
  final int id;

  const TicketInformationEventFetch({required this.id});

  @override
  List<Object> get props => [id];
}