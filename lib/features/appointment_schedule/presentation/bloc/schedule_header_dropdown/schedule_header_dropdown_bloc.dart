

import 'package:flutter_bloc/flutter_bloc.dart';

import 'schedule_header_dropdown_event.dart';
import 'schedule_header_dropdown_state.dart';

class ScheduleHeaderDropdownBloc extends Bloc<ScheduleHeaderDropdownEvent,ScheduleHeaderDropdownState>{
  ScheduleHeaderDropdownBloc() : super(ScheduleHeaderDropdownState()){
    on<ScheduleHeaderDropdownSetEvent>((event, emit) {
      emit(ScheduleHeaderDropdownState(value: event.value));
    });
  }

}