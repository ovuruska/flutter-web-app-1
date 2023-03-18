import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/delete_employee.dart';
import '../../domain/usecases/get_employee.dart';
import '../../domain/usecases/patch_employee.dart';
import 'employee_modify_event.dart';
import 'employee_modify_state.dart';

class EmployeeModifyBloc extends Bloc<EmployeeModifyEvent, EmployeeModifyState> {
  final DeleteEmployeeUseCase deleteEmployee;
  final PatchEmployeeUseCase patchEmployee;
  final GetEmployeeUseCase getEmployee;

  EmployeeModifyBloc({
    required this.deleteEmployee,
    required this.patchEmployee,
    required this.getEmployee,

  }) : super(Initial()) {

    on<EmployeeModifyRemoveEvent>((event,emit)async {
      var id = event.id;
      emit(Loading());
      var params = DeleteEmployeeParams(id: id);
      await deleteEmployee(params);
      emit(Initial());

    });
    on<EmployeeModifySaveEvent>((event,emit) async {

      var employee = event.employee;
      var params = PatchEmployeeParams(employee: employee);
      await patchEmployee(params);


    });
    on<EmployeeModifySetEvent>((event,emit)async{
      var employee = event.id;
      emit(Loading());
      var params = GetEmployeeParams(id: employee);

      var result = await getEmployee(params);
      result.fold((failure) => emit(Failure("Request failed.")), (employee) =>emit(Loaded(employee)));
    });

  }
}
