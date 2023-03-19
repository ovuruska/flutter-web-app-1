


import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/common/scheduling/default_context.dart';
import 'package:scrubbers_employee_application/common/scheduling/scheduling_context.dart';
import 'package:scrubbers_employee_application/common/scheduling/scheduling_context_provider.dart';

import 'data/repositories/appointment_repository_impl.dart';
import 'domain/repositories/appointment_repository.dart';
import 'domain/usecases/get_appointments.dart';
import 'domain/usecases/patch_appointment.dart';
import 'presentation/bloc/daily_column_bloc.dart';

registerDailyColumn(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => DailyColumnBloc(
    getAppointments: sl(),patchAppointment: sl()
  ));

  // Repositories
  sl.registerLazySingleton<SchedulingAppointmentRepository>(() => SchedulingAppointmentRepositoryImpl());

  // Use Cases
  sl.registerLazySingleton(() => DailyColumnGetAppointmentsUseCase(sl()));
  sl.registerLazySingleton(() => DailyColumnPatchAppointmentUseCase(sl()));

}