import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/usecases/get_appointments.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/appointment_schedule_event.dart';

import '../../../../widgets/cards/root/entity.dart';
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
    on<AppointmentScheduleInitializeEvent>((event, emit) {
      emit(Initial());
    });
    on<AppointmentSchedulePatchEvent>((event, emit) async {
    var appointment = event.appointment;
      var params = PatchAppointmentParams( appointment);
      var result = await patchAppointment(params);

      var currentAppointments = (state as Loaded).appointments;
      bool found = false;

    currentAppointments = currentAppointments.map((e) {
        if(e.id == appointment.id){
          found = true;
          return appointment;
        }
        return e;
      }).toList();
      if(!found){
        currentAppointments.add(appointment);
      }
      emit(Loaded(employees: (state as Loaded).employees,appointments: currentAppointments));
    });
    on<AppointmentScheduleGetEmployeesEvent>((event, emit) async {
      List<DashboardAppointmentEntity> appointments = [];
      List <DashboardEmployeeEntity> employees = [];
      if(state == Loaded){
        employees = (state as Loaded).employees;
        appointments = (state as Loaded).appointments;
      }
      var date = event.date;
      var branch = event.branch;
      var params = GetBranchEmployeesParams(date: date, branch: branch);
      var result = await getEmployees(params);
      result.fold((l) {}, (r) {
        
        employees = mergeEmployees(employees,getAppointmentEmployees(appointments));

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
        employees = mergeEmployees(employees,getAppointmentEmployees(r));
        emit(Loaded(employees: employees,appointments: r));
      });
    });
  }

  List<DashboardEmployeeEntity> getAppointmentEmployees(List<DashboardAppointmentEntity> appointments){
    List<DashboardEmployeeEntity> result = [];
    List<int> ids = [];
    for(var appointment in appointments){
      var employee = DashboardEmployeeEntity(id: appointment.employee, name: appointment.employeeName, role: appointment.service);
      if(!ids.contains(employee.id)){
        ids.add(employee.id);
        result.add(employee);
      }
    }
    return result;
  }

  List<DashboardEmployeeEntity> mergeEmployees(List<DashboardEmployeeEntity> a, List<DashboardEmployeeEntity> b){

    List<DashboardEmployeeEntity> result = b;
    var ids = b.map((e) => e.id).toList();
    for(var employee in a){
      if(!ids.contains(employee.id)){
        result.add(employee);
      }
    }
    return result;

  }
}
