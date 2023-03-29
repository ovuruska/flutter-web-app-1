
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_client_upcoming_appointments.dart';

import 'upcoming_appointments_event.dart';
import 'upcoming_appointments_state.dart';

class TicketInformationUpcomingAppointmentsBloc extends Bloc<TicketInformationUpcomingAppointmentsEvent, TicketInformationUpcomingAppointmentsState> {
  final GetClientUpcomingAppointmentsUseCase getUpcomingAppointments;

  TicketInformationUpcomingAppointmentsBloc({
    required this.getUpcomingAppointments
}) : super(TicketInformationUpcomingAppointmentsStateLoading()){
    on<TicketInformationUpcomingAppointmentsEventFetch>((event, emit) async {
      var clientId = event.id;
      var params = GetClientUpcomingAppointmentsParams(id: clientId);
      var response = await getUpcomingAppointments(params);
      response.fold((failure) {
        emit(TicketInformationUpcomingAppointmentsStateError());
      }, (appointments) {
        emit(TicketInformationUpcomingAppointmentsStateLoaded(appointments: appointments));
      });
    });
  }

}