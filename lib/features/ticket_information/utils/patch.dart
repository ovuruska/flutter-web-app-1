
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/patch_appointment.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/employee_schedule/employee_schedule_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/employee_schedule/employee_schedule_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/schedule_header_dropdown/schedule_header_dropdown_bloc.dart';
import 'package:scrubbers_employee_application/features/ticket_information/utils/conversion.dart';
import 'package:scrubbers_employee_application/injection.dart';

ticketInformationPatchAppointment(AppointmentEntity appointment) {
  var schedulingAppointment = appointment.toSchedulingAppointmentEntity();
  var params =
  PatchAppointmentParams(appointment.toSchedulingAppointmentEntity());
  sl<PatchAppointmentUseCase>().call(params);
  if (sl<ScheduleHeaderDropdownBloc>().isEmployee()) {
    sl<EmployeeScheduleBloc>().add(
        EmployeeScheduleLocalPatchEvent(appointment: schedulingAppointment));
  } else {
    sl<AppointmentScheduleBloc>().add(AppointmentScheduleEventPatchLocal(
        appointment: schedulingAppointment));
  }
}