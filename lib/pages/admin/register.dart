

import 'package:get_it/get_it.dart';

import '../../features/forms/employee_information_crud/domain/employee_information_updated.dart';
import 'callbacks/employee_information_updated_callback_impl.dart';

registerAdminPage(GetIt sl){
  // BLoC
  sl.registerLazySingleton<EmployeeInformationUpdatedCallback>(() => EmployeeInformationUpdatedCallbackImpl());
}