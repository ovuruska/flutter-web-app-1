import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/use_case.dart';
import '../../domain/usecases/create_new_employee.dart';
import '../../domain/usecases/get_employees.dart';
import '../../domain/usecases/patch_employee.dart';
import '../../domain/usecases/remove_employee.dart';
import 'employee_search_event.dart';
import 'employee_search_state.dart';

class EmployeeSearchBloc
    extends Bloc<EmployeeSearchEvent, EmployeeSearchState> {
  final GetEmployeesUseCase getEmployees;
  final CreateNewEmployeeUseCase createNewEmployee;
  final PatchEmployeeUseCase patchEmployee;
  final RemoveEmployeeUseCase removeEmployee;

  EmployeeSearchBloc({
    required this.createNewEmployee,
    required this.getEmployees,
    required this.patchEmployee,
    required this.removeEmployee,
  }) : super(Initial()) {
    on<EmployeeSearchEventGet>((event, emit) async {
      emit(Loading());

      final failureOrEmployees = await getEmployees(NoParams());

      failureOrEmployees.fold(
              (failure) => emit(Failed(message: "Failed to get branches.")),
              (employees) => emit(Loaded(employees: employees)));
    });
    on<EmployeeSearchEventSetEmployees>((event, emit) async {
      var employees = event.employees;
      emit(Loaded(employees: employees));
    });

    on<EmployeeSearchEventPatch>((event, emit) async {
      var employee = event.employee;
      var employees = (state as Loaded).employees;
      var updatedEmployees = employees.map((element) {
        if(element.id == employee.id) {
          return employee;
        }
        return element;
      }).toList();

      emit(Loaded(employees: updatedEmployees));
    });
    on<EmployeeSearchEventCreate>((event,emit) async {
      var employees = (state as Loaded).employees;
      final failureOrBranch = await createNewEmployee(NoParams());
      failureOrBranch.fold(
              (failure){
                emit(Failed(message: "Failed to create new employee."));
                emit(Loaded(employees: employees));
              },
              (employee) => emit(Loaded(employees: employees + [employee])));
    });

    on<EmployeeSearchEventRemove>((event, emit) async {
      var employees = (state as Loaded).employees;
      var id = event.id;
      removeEmployee(RemoveEmployeeParams(id: id));
      var updatedEmployees = employees.where((element) => element.id != id).toList();
      emit(Loaded(employees: updatedEmployees));
    });
  }
}
