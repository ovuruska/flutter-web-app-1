import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/bloc/client_details/client_details_bloc.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/bloc/prior_appointments/prior_appointments_bloc.dart';

import 'presentation/bloc/ticket_information/ticket_information_bloc.dart';
import 'presentation/bloc/upcoming_appointments/upcoming_appointments_bloc.dart';

registerTicketInformation(GetIt sl) {
  sl.registerLazySingleton(() => TicketInformationBloc(
        getAppointment: sl(),
      ));

  sl.registerLazySingleton(
      () => TicketInformationClientDetailsBloc(getClientDetails: sl()));

  sl.registerLazySingleton(() =>
      TicketInformationUpcomingAppointmentsBloc(getUpcomingAppointments: sl()));

  sl.registerLazySingleton(
      () => TicketInformationPriorAppointmentsBloc(getPriorAppointments: sl()));
}
