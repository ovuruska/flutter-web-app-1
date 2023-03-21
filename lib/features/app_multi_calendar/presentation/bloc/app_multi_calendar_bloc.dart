

import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_multi_calendar_event.dart';
import 'app_multi_calendar_state.dart';

class AppMultiCalendarBloc extends Bloc<AppMultiCalendarEvent, AppMultiCalendarState> {
  AppMultiCalendarBloc() : super(AppMultiCalendarState()){
    on<AppMultiCalendarEventSetDate>((event, emit) {
      emit(AppMultiCalendarState(date: event.date));
    });
  }


}