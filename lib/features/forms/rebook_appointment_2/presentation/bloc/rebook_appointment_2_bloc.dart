

import 'package:flutter_bloc/flutter_bloc.dart';

import 'rebook_appointment_2_event.dart';
import 'rebook_appointment_2_state.dart';

class RebookAppointment2Bloc extends Bloc<RebookAppointment2Event,RebookAppointment2State>{
  RebookAppointment2Bloc() : super(RebookAppointment2StateInitial()){
    on<RebookAppointment2EventSet>((event, emit) {

      emit(RebookAppointment2StateInitial(
        startDate: event.startDate,
        groomers: event.groomers,
        branches: event.branches,
        service: event.service,
        duration: event.duration,
        client: event.client,
      ));
    });
  }

}