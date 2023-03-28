import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/usecases/get_client_prior_appointments.dart';
import '../upcoming_appointments/upcoming_appointments_event.dart';
import '../upcoming_appointments/upcoming_appointments_state.dart';
import 'prior_appointments_event.dart';
import 'prior_appointments_state.dart';

class TicketInformationPriorAppointmentsBloc extends Bloc<
    TicketInformationPriorAppointmentsEvent,
    TicketInformationPriorAppointmentsState> {
  final GetClientPriorAppointmentsUseCase getPriorAppointments;

  TicketInformationPriorAppointmentsBloc({required this.getPriorAppointments})
      : super(TicketInformationPriorAppointmentsStateLoading()) {
    on<TicketInformationPriorAppointmentsEventFetch>((event, emit) async {
      var clientId = event.id;
      var params = GetClientPriorAppointmentsParams(id: clientId);
      var response = await getPriorAppointments(params);
      response.fold((failure) {
        emit(TicketInformationPriorAppointmentsStateError());
      }, (appointments) {
        emit(TicketInformationPriorAppointmentsStateLoaded(
            appointments: appointments));
      });
    });
  }
}
