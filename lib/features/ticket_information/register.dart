

import 'package:get_it/get_it.dart';

import 'presentation/bloc/ticket_information_bloc.dart';

registerTicketInformation(GetIt sl) {
  sl.registerLazySingleton(() => TicketInformationBloc(
    getAppointment: sl(),
  ));
}