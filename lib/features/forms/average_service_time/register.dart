

import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/forms/average_service_time/presentation/bloc/average_service_time_bloc.dart';

registerAverageServiceTime(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => AverageServiceTimeBloc(sl()));
}