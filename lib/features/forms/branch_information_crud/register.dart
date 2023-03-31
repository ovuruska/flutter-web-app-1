import 'package:get_it/get_it.dart';

import 'presentation/bloc/branch_information_crud_bloc.dart';

registerBranchInformationCrud(GetIt sl) {
  // BLoC
  sl.registerLazySingleton(() => BranchInformationCrudBloc(getBranch:sl(), patchBranch:sl()));
}
