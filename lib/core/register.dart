

import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/core/data/datasources/client_search/client_search_remote_data_source_impl.dart';

import 'data/datasources/client_search/client_search_remote_data_source.dart';
import 'data/repositories/client_search_repository_impl.dart';
import 'data/repositories/scheduling_appointment_repository_impl.dart';
import 'domain/repositories/client_search_repository.dart';
import 'domain/repositories/scheduling_appointment_repository.dart';
import 'domain/usecases/patch_appointment.dart';
import 'domain/usecases/search_client_name.dart';

registerCore(GetIt sl){
  // Use Cases
  sl.registerLazySingleton(() => PatchAppointmentUseCase(sl()));
  sl.registerLazySingleton(() => SearchClientNameUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<SchedulingAppointmentRepository>(() => SchedulingAppointmentRepositoryImpl());
  sl.registerLazySingleton<ClientSearchRepository>(() => ClientSearchRepositoryImpl(sl()));


  // Data Sources
  sl.registerLazySingleton<ClientSearchRemoteDataSource>(() => ClientSearchRemoteDataSourceImpl());


}