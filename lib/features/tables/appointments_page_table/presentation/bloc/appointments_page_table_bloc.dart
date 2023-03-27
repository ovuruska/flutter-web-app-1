

import 'package:flutter_bloc/flutter_bloc.dart';

import 'appointments_page_table_event.dart';
import 'appointments_page_table_state.dart';

class AppointmentsPageTableBloc extends Bloc<AppointmentsPageTableEvent,AppointmentsPageTableState>{
  AppointmentsPageTableBloc() : super(AppointmentsPageTableState()){
    on<AppointmentsPageTableEventSelect>((event, emit) {
      emit(AppointmentsPageTableState(selected: event.selected));
    });
    on<AppointmentsPageTableEventDeselect>((event, emit) {
      emit(AppointmentsPageTableState());

    });
  }

}