
import 'package:bloc/bloc.dart';

import '../../domain/usecases/get_concrete_appointment.dart';
import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class TicketInformationBloc
    extends Bloc<TicketInformationEvent, TicketInformationState> {
  final GetConcreteAppointment getConcreteAppointment;
  TicketInformationBloc({
    required this.getConcreteAppointment,
  }) : super(Empty()) {
    on<FetchAppointment>((event, emit) async {
      emit(Loading());
      final failureOrAppointment =
          await getConcreteAppointment(event.appointmentId);
      emit(failureOrAppointment.fold(
              (failure) => Error("Failed to load"),
              (appointment) => Loaded(appointment)));
    });
  }
}
