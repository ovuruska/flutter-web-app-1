import 'package:get_it/get_it.dart';

import 'features/ticket_information/data/repositories/ticket_information_repository_impl.dart';
import 'features/ticket_information/domain/repositories/ticket_information_repository.dart';
import 'features/ticket_information/domain/usecases/get_concrete_appointment.dart';
import 'features/ticket_information/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> initSl() async {

  // BLoC
  sl.registerLazySingleton(
        () => TicketInformationBloc(
          getConcreteAppointment: sl(),
        )
  );

  // Repository
    sl.registerLazySingleton<TicketInformationRepository>(() => TicketInformationRepositoryImpl());

  // Use cases
  sl.registerLazySingleton(() => GetConcreteAppointment(sl()));



}