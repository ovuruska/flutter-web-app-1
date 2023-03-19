

import 'package:flutter_bloc/flutter_bloc.dart';

import 'appointment_data_event.dart';
import 'appointment_data_state.dart';

class AppointmentDataBloc extends Bloc<AppointmentDataEvent,AppointmentDataState>{
  AppointmentDataBloc() : super(AppointmentDataState()){
    on<AppointmentDataEventSelect>((event, emit) {
      emit(AppointmentDataState(selected: event.selected));
    });
    on<AppointmentDataEventDeselect>((event, emit) {
      emit(AppointmentDataState());
    });
  }

}