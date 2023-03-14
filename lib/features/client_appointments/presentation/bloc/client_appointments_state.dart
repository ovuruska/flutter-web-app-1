import 'package:equatable/equatable.dart';
import '../../domain/entity/appointment_details.dart';

class ClientAppointmentsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Initial extends ClientAppointmentsState {}

class Loading extends ClientAppointmentsState {}

class Loaded extends ClientAppointmentsState {
  final List<AppointmentDetails> appointments;
  Loaded({ this.appointments = const []});
}
