

import 'package:flutter_bloc/flutter_bloc.dart';

import 'schedule_header_event.dart';
import 'schedule_header_state.dart';

class AppointmentScheduleHeaderBloc extends Bloc<ScheduleHeaderEvent,ScheduleHeaderState>{
  AppointmentScheduleHeaderBloc() : super(ScheduleHeaderState(date:DateTime.now())){
    on<ScheduleHeaderSetDateEvent>((event, emit) {
      emit(ScheduleHeaderState(date: event.date,branch:state.branch));
    });
    on<ScheduleHeaderSetBranchEvent>((event, emit) {
      emit(ScheduleHeaderState(date: state.date, branch: event.branch));
    });
  }

}