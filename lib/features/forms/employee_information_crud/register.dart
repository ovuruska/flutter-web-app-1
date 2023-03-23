import 'package:get_it/get_it.dart';

import 'presentation/bloc/employee_information_crud_bloc.dart';

registerEmployeeInformationCrud(GetIt sl) {
  // BLoC
  sl.registerLazySingleton(() => EmployeeInformationCrudBloc(getEmployee:sl(), patchEmployee:sl()));
}
