

import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/app_calendar/presentation/bloc/app_calendar_bloc.dart';

registerAppCalendar(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => AppCalendarBloc());
}