import 'package:get_it/get_it.dart';
import 'bloc/available_branch_slots_bloc.dart';

registerAvailableBranchSlots(GetIt sl) {
  sl.registerLazySingleton(() => AvailableBranchSlotsBloc(sl()));
}