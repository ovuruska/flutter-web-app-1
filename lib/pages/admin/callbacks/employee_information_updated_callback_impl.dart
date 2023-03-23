

import '../../../core/domain/entities/employee_entity.dart';
import '../../../features/forms/employee_information_crud/domain/employee_information_updated.dart';
import '../../../features/sidebars/employee_search/presentation/bloc/employee_search_bloc.dart';
import '../../../features/sidebars/employee_search/presentation/bloc/employee_search_event.dart';
import '../../../injection.dart';

class EmployeeInformationUpdatedCallbackImpl implements EmployeeInformationUpdatedCallback {
  @override
  void call(EmployeeEntity employee) {
    sl<EmployeeSearchBloc>().add(EmployeeSearchEventPatch(employee: employee));
  }
}
