import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/core/data/datasources/appointment/appointment_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/data/datasources/branch/branch_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/data/datasources/branch/branch_remote_data_source_impl.dart';
import 'package:scrubbers_employee_application/core/data/datasources/client/client_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/data/datasources/client_search/client_search_remote_data_source_impl.dart';
import 'package:scrubbers_employee_application/core/data/datasources/employee/employee_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/data/datasources/product/product_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/appointment_slot_repository.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/branch_repository.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/employee_repository.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/create_appointment.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_all_products.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_available_slots.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_average_service_time.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_client_pets.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_all_groomers.dart';

import 'data/datasources/analytics_pet/analytics_pet_remote_data_source.dart';
import 'data/datasources/analytics_pet/analytics_pet_remote_data_source_impl.dart';
import 'data/datasources/appointment/appointment_remote_data_source_impl.dart';
import 'data/datasources/appointment_slot/appointment_slot_local_data_source_impl.dart';
import 'data/datasources/appointment_slot/appointment_slot_remote_data_source.dart';
import 'data/datasources/appointment_slot/appointment_slot_remote_data_source_impl.dart';
import 'data/datasources/client/client_remote_data_source_impl.dart';
import 'data/datasources/client_search/client_search_remote_data_source.dart';
import 'data/datasources/employee/employee_remote_data_source_impl.dart';
import 'data/datasources/product/product_remote_data_source_impl.dart';
import 'data/repositories/analytics_pet_repository_impl.dart';
import 'data/repositories/appointment_repository_impl.dart';
import 'data/repositories/appointment_slot_repository_impl.dart';
import 'data/repositories/branch_repository_impl.dart';
import 'data/repositories/client_repository_impl.dart';
import 'data/repositories/client_search_repository_impl.dart';
import 'data/repositories/employee_repository_impl.dart';
import 'data/repositories/product_repository_impl.dart';
import 'data/repositories/scheduling_appointment_repository_impl.dart';
import 'domain/repositories/analytics_pet_repository.dart';
import 'domain/repositories/appointment_repository.dart';
import 'domain/repositories/client_repository.dart';
import 'domain/repositories/client_search_repository.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/repositories/scheduling_appointment_repository.dart';
import 'domain/usecases/get_all_branches.dart';
import 'domain/usecases/patch_appointment.dart';
import 'domain/usecases/search_client_name.dart';

registerCore(GetIt sl) {
  // Use Cases
  sl.registerLazySingleton(() => PatchAppointmentUseCase(sl()));
  sl.registerLazySingleton(() => SearchClientNameUseCase(sl()));
  sl.registerLazySingleton(() => GetClientPetsUseCase(sl()));
  sl.registerLazySingleton(() => GetAverageServiceTimeUseCase(sl()));
  sl.registerLazySingleton(() => GetAllGroomersUseCase(sl()));
  sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetAllBranchesUseCase(sl()));
  sl.registerLazySingleton(() => GetAvailableSlotsUseCase(sl()));
  sl.registerLazySingleton(() => CreateAppointmentUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<SchedulingAppointmentRepository>(
      () => SchedulingAppointmentRepositoryImpl());
  sl.registerLazySingleton<ClientSearchRepository>(
      () => ClientSearchRepositoryImpl(sl()));
  sl.registerLazySingleton<ClientRepository>(() => ClientRepositoryImpl(sl()));
  sl.registerLazySingleton<AnalyticsPetRepository>(
      () => AnalyticsPetRepositoryImpl(sl()));
  sl.registerLazySingleton<EmployeeRepository>(
      () => EmployeeRepositoryImpl(sl()));
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(sl()));
  sl.registerLazySingleton<BranchRepository>(() => BranchRepositoryImpl(sl()));
  sl.registerLazySingleton<AppointmentSlotRepository>(
      () => AppointmentSlotRepositoryImpl(sl()));
  sl.registerLazySingleton<AppointmentRepository>(
      () => AppointmentRepositoryImpl(sl()));

  // Data Sources
  sl.registerLazySingleton<ClientSearchRemoteDataSource>(
      () => ClientSearchRemoteDataSourceImpl());
  sl.registerLazySingleton<ClientRemoteDataSource>(
      () => ClientRemoteDataSourceImpl());
  sl.registerLazySingleton<AnalyticsPetRemoteDataSource>(
      () => AnalyticsPetRemoteDataSourceImpl());
  sl.registerLazySingleton<EmployeeRemoteDataSource>(
      () => EmployeeRemoteDataSourceImpl());
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl());

  sl.registerLazySingleton<BranchRemoteDataSource>(
      () => BranchRemoteDataSourceImpl());

  sl.registerLazySingleton<AppointmentSlotRemoteDataSource>(
      () => AppointmentSlotRemoteDataSourceImpl());

  sl.registerLazySingleton<AppointmentRemoteDataSource>(
      () => AppointmentRemoteDataSourceImpl());
}
