import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/dog_appointments/data/repositories/dog_appointments_repository_impl.dart';
import 'package:scrubbers_employee_application/features/dog_appointments/domain/repositories/dog_appointments_repository.dart';
import 'package:scrubbers_employee_application/features/dog_appointments/domain/usecases/get_upcoming_appointments.dart';
import 'package:scrubbers_employee_application/features/dog_appointments/presentation/bloc/dog_appointments_bloc.dart';

import 'features/dog_appointments/domain/usecases/get_prior_appointments.dart';
import 'features/ticket_information/data/repositories/ticket_information_repository_impl.dart';
import 'features/ticket_information/domain/repositories/ticket_information_repository.dart';
import 'features/ticket_information/domain/usecases/get_concrete_appointment.dart';
import 'features/ticket_information/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> initSl() async {
  // BLoC
  sl.registerLazySingleton(() => TicketInformationBloc(
        getConcreteAppointment: sl(),
      ));

  // Repository
  sl.registerLazySingleton<TicketInformationRepository>(
      () => TicketInformationRepositoryImpl());

  // Use cases
  sl.registerLazySingleton(() => GetConcreteAppointment(sl()));

  sl.registerLazySingleton(() => DogAppointmentsBloc(
      getPriorAppointments: sl(), getUpcomingAppointments: sl()));

  sl.registerLazySingleton(() => GetPriorAppointments(sl()));
  sl.registerLazySingleton(() => GetUpcomingAppointments(sl()));

  sl.registerLazySingleton<DogAppointmentsRepository>(
      () => DogAppointmentsRepositoryImpl());
}
