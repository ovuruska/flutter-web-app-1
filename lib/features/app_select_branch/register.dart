import 'package:get_it/get_it.dart';
import 'presentation/bloc/app_select_branch_bloc.dart';

registerAppSelectBranch(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => AppSelectBranchBloc(sl()));

}
