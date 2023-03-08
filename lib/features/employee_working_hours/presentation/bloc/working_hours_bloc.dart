/*

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
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/employee_working_hours/domain/entities/interval_entity.dart';
import 'package:scrubbers_employee_application/features/employee_working_hours/domain/usecases/get_working_hours.dart';
import '../../domain/usecases/clear_working_hours.dart';
import '../../domain/usecases/upsert_working_hours.dart';
import 'working_hours_event.dart';
import 'working_hours_state.dart';

class EmployeeWorkingHoursBloc
    extends Bloc<EmployeeWorkingHoursEvent, EmployeeWorkingHoursState> {
  final GetWorkingHoursUseCase getWorkingHours;
  final ClearWorkingHoursUseCase clearWorkingHours;
  final UpsertWorkingHoursUseCase upsertWorkingHours;

  EmployeeWorkingHoursBloc({
    required this.clearWorkingHours,
    required this.upsertWorkingHours,
    required this.getWorkingHours,
  }) : super(Empty()) {
    on<GetEmployeeWorkingHoursEvent>((event, emit) async {
      emit(Loading());
      var employeeId = event.id;
      var interval = event.interval;

      var params = GetWorkingHoursParams(id: employeeId, interval: interval);
      var failureOrWorkingHours = await getWorkingHours(params);
      failureOrWorkingHours.fold(
          (failure) => emit(Failed(message: "Failed to get working hours.")),
          (workingHours) => emit(Loaded(workingHours: workingHours,id:employeeId)));
    });


    on<UpsertWorkingHoursEvent>((event,emit) async {
      var workingHours = event.workingHours;
      var employeeId = event.id;
      var params = UpsertWorkingHoursParams(id:employeeId,workingHours: workingHours);
      var failureOrWorkingHours = await upsertWorkingHours(params);
    });
    on<SetEmployeeEvent>((event, emit) async {
      emit(Loading());
      var employeeId = event.id;

      var now = DateTime.now();
      var monday = now.subtract(Duration(days: now.weekday - 1));
      var nextMonday = monday.add(Duration(days: 7));
      var interval = IntervalEntity(start: monday, end: nextMonday);
      var params = GetWorkingHoursParams(id: event.id, interval: interval);

      var failureOrWorkingHours = await getWorkingHours(params);
      failureOrWorkingHours.fold(
          (failure) => emit(Failed(message: "Failed to get working hours.")),
          (workingHours) => emit(Loaded(workingHours: workingHours,id:employeeId)));
    });

    on<ClearWorkingHoursEvent>((event,emit) async {
      var employeeId = event.id;
      var now = DateTime.now();
      var monday = now.subtract(Duration(days: now.weekday - 1));
      var nextMonday = monday.add(Duration(days: 7));
      var interval = IntervalEntity(start: monday, end: nextMonday);
      var params = ClearWorkingHoursParams(id: employeeId, interval: interval);
      await clearWorkingHours.call(params);
      emit(Initial(id: employeeId));

    });


  }
}
