import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../models/Appointment.dart';

@immutable
abstract class TicketInformationState extends Equatable{
  @override
  List<Object?> get props => [];
}

class Start extends TicketInformationState {
  final int appointmentId;

  Start({required this.appointmentId});

  @override
  List<Object?> get props => [appointmentId];
}

class Empty extends TicketInformationState {}

class Loading extends TicketInformationState {}

class Loaded extends TicketInformationState {

  final Appointment appointment;

  Loaded(this.appointment);

  @override
  List<Object?> get props => [appointment.id];
}

class Error extends TicketInformationState {
  final String message;

  Error(this.message);

  @override
  List<Object?> get props => [message];
}