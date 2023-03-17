

import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_calendar_event.dart';
import 'app_calendar_state.dart';

class AppCalendarBloc extends Bloc<AppCalendarEvent,AppCalendarState>{
  AppCalendarBloc() : super(AppCalendarState()){
    on<AppCalendarSetDateEvent>((event, emit) {
      emit(AppCalendarState(date: event.date));
    });
  }
  
}