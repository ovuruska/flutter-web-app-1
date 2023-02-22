import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TicketInformationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAppointment extends TicketInformationEvent {
  final int appointmentId;

  FetchAppointment(this.appointmentId);

  @override
  List<Object> get props => [appointmentId];
}

