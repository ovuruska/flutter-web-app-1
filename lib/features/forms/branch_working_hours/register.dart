import 'package:get_it/get_it.dart';

import '../../../core/domain/usecases/clear_working_hours.dart';
import '../../../core/domain/usecases/get_working_hours.dart';
import '../../../core/domain/usecases/upsert_working_hours.dart';
import 'presentation/bloc/branch_working_hours_bloc.dart';

registerBranchWorkingHours(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => BranchWorkingHoursBloc(
        upsertWorkingHours: sl(),
        clearWorkingHours: sl(),
        getWorkingHours: sl(),
      ));

  // Use cases


  // Repositories
}
