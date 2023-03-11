import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_appointment_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/usecases/get_appointments.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/appointment_schedule_event.dart';

import '../../domain/usecases/get_branch_employees.dart';
import '../../domain/usecases/patch_appointment.dart';
import 'appointment_schedule_state.dart';

class AppointmentScheduleBloc
    extends Bloc<AppointmentScheduleEvent, AppointmentScheduleState> {
  final PatchAppointmentUseCase patchAppointment;
  final GetAppointmentsUseCase getAppointments;
  final GetBranchEmployeesUseCase getEmployees;

  AppointmentScheduleBloc({
    required this.getAppointments,
    required this.getEmployees,
    required this.patchAppointment
  }) : super(Initial()) {
    on<AppointmentSchedulePatchEvent>((event, emit) {});
    on<AppointmentScheduleGetEmployeesEvent>((event, emit) async {
      List<DashboardAppointmentEntity> appointments = [];
      List <DashboardEmployeeEntity> employees = [];
      if(state == Loaded){
        appointments = (state as Loaded).appointments;
        employees = (state as Loaded).employees;
      }
      var date = event.date;
      var branch = event.branch;
      var params = GetBranchEmployeesParams(date: date, branch: branch);
      var result = await getEmployees(params);
      result.fold((l) {}, (r) {
        emit(Loaded(employees: r,appointments: appointments));
      });
    });
    on<AppointmentScheduleGetAppointmentsEvent>((event, emit) async {
      List<DashboardEmployeeEntity>  employees = [];
      if(state == Loaded){
        employees = (state as Loaded).employees;
      }
      var date = event.date;
      var branch = event.branch;
      var params = GetAppointmentsParams(date: date, branch: branch);
      var result = await getAppointments(params);




      result.fold((l) {}, (r){

        emit(Loaded(employees: employees,appointments: r));
      });
    });
  }
}
