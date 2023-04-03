import 'package:flutter_bloc/flutter_bloc.dart';

import 'schedule_header_dropdown_event.dart';
import 'schedule_header_dropdown_state.dart';

final List<String> values = ["All Employees", "We Wash", "Full Grooming"];

class ScheduleHeaderDropdownBloc
    extends Bloc<ScheduleHeaderDropdownEvent, ScheduleHeaderDropdownState> {
  ScheduleHeaderDropdownBloc() : super(ScheduleHeaderDropdownState()) {
    on<ScheduleHeaderDropdownEventSet>((event, emit) {
      emit(ScheduleHeaderDropdownState(value: event.value));
    });
  }

  bool isEmployee() {
    return !values.contains(state.value);
  }

  bool isBranchCalendar(){
    return values.contains(state.value);

  }
}