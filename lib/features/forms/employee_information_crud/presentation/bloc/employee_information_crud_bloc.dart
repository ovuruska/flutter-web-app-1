

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/usecases/get_employee.dart';
import '../../../../../core/domain/usecases/patch_employee.dart';
import 'employee_information_crud_event.dart';
import 'employee_information_crud_state.dart';

class EmployeeInformationCrudBloc extends Bloc<EmployeeInformationCrudEvent,EmployeeInformationCrudState>{
  final GetEmployeeUseCase getEmployee;
  final PatchEmployeeUseCase patchEmployee;


  EmployeeInformationCrudBloc({
    required this.getEmployee, required this.patchEmployee
  }) : super(EmployeeInformationCrudState()){
    on<EmployeeInformationCrudEventGet>((event, emit) async {
      final result = await getEmployee(GetEmployeeParams(event.id));
      result.fold((l) => emit(EmployeeInformationCrudState()), (r) => emit(EmployeeInformationCrudState(employee: r)));
    });
    on<EmployeeInformationCrudEventSet>((event, emit) async {
      var newState = EmployeeInformationCrudState(employee: event.employee);
      emit(newState);
    });
    on<EmployeeInformationCrudEventPatch>((event, emit) async {
      final result = await patchEmployee(PatchEmployeeParams(employee: event.employee));
    });
  }
}