

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/employee_schedule/employee_schedule_bloc.dart';

import '../../../common/scheduling/calculate_appointment_details.dart';
import '../../../common/scheduling/scheduling_context_provider.dart';
import '../../../injection.dart';
import '../presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import '../presentation/bloc/employee_schedule/employee_schedule_event.dart';


onAcceptWithBranch(BuildContext context)=>(DateTime date,int startHour,int employee) => (DragTargetDetails<SchedulingAppointmentEntity> details) {
  var schedulingContext = SchedulingContextProvider.of(context);

  var data = calculateAppointmentDetails(schedulingContext,details,date,startHour,employee);
  sl<AppointmentScheduleBloc>().add(
    AppointmentSchedulePatchEvent(appointment: data),
  );

};

onAcceptWithEmployee(BuildContext context) => (DateTime date,int startHour,int employee) => (DragTargetDetails<SchedulingAppointmentEntity> details){
  var schedulingContext = SchedulingContextProvider.of(context);
  var data = calculateAppointmentDetails(schedulingContext,details,date,startHour,employee);
  sl<EmployeeScheduleBloc>().add(
    EmployeeSchedulePatchEvent(appointment: data),
  );
};