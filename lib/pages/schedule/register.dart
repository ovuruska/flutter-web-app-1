

import 'package:get_it/get_it.dart';

import '../../features/app_multi_calendar/domain/callbacks/calendar_set_date.dart';
import '../../features/app_select_branch/domain/callbacks/set_branch_callback.dart';
import '../../features/appointment_schedule/domain/callbacks/appointment_header_set_date.dart';
import '../../features/forms/rebook_appointment_2/domain/callbacks/start_date_selected_callback.dart';
import 'callbacks/schedule_set_date_impl.dart';
import 'callbacks/set_branch_impl.dart';
import 'callbacks/set_date_impl.dart';
import 'callbacks/start_date_selected_callback_impl.dart';

registerSchedulePage(GetIt sl){
  sl.registerLazySingleton<AppointmentHeaderSetDateCallback>(() => AppointmentHeaderSetDateCallbackImpl());
  sl.registerLazySingleton<AppSelectBranchSetBranchCallback>(() => ScheduleSetBranchCallbackImpl());
  sl.registerLazySingleton<AppMultiCalendarSetDateCallback>(() => ScheduleSetDateCallbackImpl());
  sl.registerLazySingleton<StartDateSelectedCallback>(() => StartDateSelectedCallbackImpl());
}