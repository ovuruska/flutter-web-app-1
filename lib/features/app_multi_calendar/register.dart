

import 'package:get_it/get_it.dart';

import 'presentation/bloc/app_multi_calendar_bloc.dart';

registerAppMultiCalendar(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => AppMultiCalendarBloc());
}