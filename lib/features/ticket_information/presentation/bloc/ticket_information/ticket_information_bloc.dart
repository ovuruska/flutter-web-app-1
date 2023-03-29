import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_appointment.dart';

import 'ticket_information_event.dart';
import 'ticket_information_state.dart';

class TicketInformationBloc
    extends Bloc<TicketInformationEvent, TicketInformationState> {
  final GetAppointmentUseCase getAppointment;
  TicketInformationBloc({required this.getAppointment})
      : super(TicketInformationStateLoading()) {
    on<TicketInformationEventFetch>((event, emit)  async {
      var appointmentId = event.id;
      var params = GetAppointmentParams(id: appointmentId);
      var response = await getAppointment(params);
      response.fold((failure) {
        emit(TicketInformationStateError());
      }, (appointment) {
        emit(TicketInformationStateLoaded(appointment: appointment));
      });
    });
  }
}
