import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/use_case.dart';
import '../../domain/usecases/create_appointment.dart';
import '../../domain/usecases/get_branches.dart';
import '../../domain/usecases/get_employees.dart';
import 'create_appointment_event.dart';
import 'create_appointment_state.dart';

class CreateAppointmentBloc
    extends Bloc<CreateAppointmentEvent, CreateAppointmentBaseState> {
  final GetBranchesUseCase getBranches;
  final GetEmployeesUseCase getEmployees;
  final CreateAppointmentUseCase createAppointment;

  CreateAppointmentBloc({
    required this.createAppointment,
    required this.getBranches,
    required this.getEmployees,
  }) : super(Empty()) {
    on<GetBranchesEvent>((event, emit) async {
      emit(Loading());
      final failureOrBranches = await getBranches(NoParams());

      failureOrBranches
          .fold((failure) => emit(Failed(message: "Failed to get branches.")),
              (branches) {
        emit(CreateAppointmentState(branches: branches, employees: const []));
        if (branches.isEmpty) return;
        add(GetEmployeesEvent(branchId: branches[0].id));
      });
    });
    on<PostAppointmentEvent>((event, emit) async {
      var branches = (state as CreateAppointmentState).branches;
      var employees = (state as CreateAppointmentState).employees;
      emit(Loading());
      var appointment = event.appointment;
      var sideEffect = event.sideEffect;
      var failureOrAppointment = await createAppointment(
          CreateAppointmentParams(appointment: appointment));
      failureOrAppointment.fold((failure) => emit(Failed(message: "Failed to create appointment.")), (appointment) {
        CreateAppointmentState(
            employees: employees, branches: branches);
        sideEffect!(appointment);
      });
    });
    on<GetEmployeesEvent>((event, emit) async {
      var branches = (state as CreateAppointmentState).branches;
      emit(Loading());

      var failureOrEmployees =
          await getEmployees(GetEmployeesParams(branchId: event.branchId));
      failureOrEmployees.fold(
          (failure) => emit(Failed(message: "Failed to get employees.")),
          (employees) => emit(CreateAppointmentState(
              employees: employees, branches: branches)));
    });
  }
}
