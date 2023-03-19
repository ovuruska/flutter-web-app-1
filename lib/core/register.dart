

import 'package:get_it/get_it.dart';

import 'data/repositories/scheduling_appointment_repository_impl.dart';
import 'domain/repositories/scheduling_appointment_repository.dart';
import 'domain/usecases/patch_appointment.dart';

registerCore(GetIt sl){
  // Use Cases
  sl.registerLazySingleton(() => PatchAppointmentUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<SchedulingAppointmentRepository>(() => SchedulingAppointmentRepositoryImpl(
  ));

}