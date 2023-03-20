

import 'package:flutter_bloc/flutter_bloc.dart';

import 'schedule_header_event.dart';
import 'schedule_header_state.dart';

class AppointmentScheduleHeaderBloc extends Bloc<AppointmentScheduleHeaderEvent,AppointmentScheduleHeaderState>{
  AppointmentScheduleHeaderBloc() : super(AppointmentScheduleHeaderState(date:DateTime.now())){
    on<AppointmentScheduleHeaderEventSetDate>((event, emit) {
      emit(AppointmentScheduleHeaderState(date: event.date,branch:state.branch));
    });
    on<AppointmentScheduleHeaderEventSetBranch>((event, emit) {
      emit(AppointmentScheduleHeaderState(date: state.date, branch: event.branch));
    });
  }

}