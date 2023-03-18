import 'package:get_it/get_it.dart';

import 'data/repositories/view_logs_impl.dart';
import 'domain/repositories/view_logs_repository.dart';
import 'domain/usecases/get_logs.dart';
import 'presentation/bloc/view_logs_bloc.dart';

registerViewLogs(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => ViewLogsBloc(viewLogsRepository: sl()));

  // Repositories
  sl.registerLazySingleton<ViewLogsRepository>(() => ViewLogsRepositoryImpl());

  // Use cases
  sl.registerLazySingleton(() => GetLogsUseCase(sl()));
}