import 'package:equatable/equatable.dart';
import '../../../../models/Appointment.dart';

class DogAppointmentsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class Start extends DogAppointmentsState {
  final int petId;

  Start({required this.petId});

  @override
  List<Object?> get props => [petId];
}

class Failed extends DogAppointmentsState {
  final String message;

  Failed({required this.message});

  @override
  List<Object?> get props => [message];
}

class Empty extends DogAppointmentsState {}

class Loading extends DogAppointmentsState {}

class Loaded extends DogAppointmentsState {

  final List<Appointment> upcomingAppointments;
  final List<Appointment> pastAppointments;

  Loaded(this.upcomingAppointments, this.pastAppointments);

  @override
  List<Object?> get props => [upcomingAppointments, pastAppointments];
}