import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/dog_appointments/domain/usecases/get_prior_appointments.dart';
import 'package:scrubbers_employee_application/features/dog_appointments/presentation/bloc/dog_appointments_event.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';

import '../../domain/usecases/get_upcoming_appointments.dart';
import 'dog_appointments_state.dart';

class DogAppointmentsBloc
    extends Bloc<DogAppointmentsEvent, DogAppointmentsState> {
  final GetPriorAppointments getPriorAppointments;
  final GetUpcomingAppointments getUpcomingAppointments;
  DogAppointmentsBloc(
      {required this.getPriorAppointments,
      required this.getUpcomingAppointments})
      : super(Empty()) {
    on<FetchAppointments>((event, emit) async* {
      emit(Loading());
      var failureOrAppointment = await getUpcomingAppointments(event.petId);
      var upcomingAppointments = failureOrAppointment.fold(
          (failure) => <Appointment>[], (appointment) => appointment);
      failureOrAppointment = await getPriorAppointments(event.petId);
      var pastAppointments = failureOrAppointment.fold(
          (failure) => <Appointment>[], (appointment) => appointment);
      emit(Loaded(upcomingAppointments, pastAppointments));
    });
  }
}
