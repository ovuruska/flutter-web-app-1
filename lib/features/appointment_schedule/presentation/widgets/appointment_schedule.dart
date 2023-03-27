import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/scheduling/current_time_ray.dart';
import 'package:scrubbers_employee_application/common/scheduling/scheduling_context_provider.dart';
import 'package:scrubbers_employee_application/common/scheduling/scheduling_hour_column.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/on_accept_with_details.dart';

import '../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../common/scheduling/scheduling_daily_calendar_column.dart';
import '../../../../injection.dart';
import '../../domain/entities/dashboard_employee_entity.dart';
import '../bloc/branch_schedule/appointment_schedule_bloc.dart';

class AppointmentSchedule extends StatefulWidget {
  final DateTime date;
  final List<SchedulingAppointmentEntity> appointments;
  final List<DashboardEmployeeEntity> employees;
  final int? branch;

  const AppointmentSchedule(
      {Key? key,
      required this.date,
      required this.branch,
      required this.appointments,
      required this.employees})
      : super(key: key);

  @override
  _AppointmentScheduleState createState() => _AppointmentScheduleState();
}

class _AppointmentScheduleState extends State<AppointmentSchedule> {
  Widget _noemployees() => Container(
        child: Center(child: Text("No employees available.")),
      );

  Widget _horizontal(BuildContext context) {
    var schedulingContext = SchedulingContextProvider.of(context);

    return Scrollbar(
        controller: schedulingContext.horizontalController,
        scrollbarOrientation: ScrollbarOrientation.top,
        child: SingleChildScrollView(
            controller: schedulingContext.horizontalController,
            scrollDirection: Axis.horizontal,
            child: Stack(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    margin:
                        EdgeInsets.only(top: schedulingContext.headerHeight),
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: SchedulingHourColumn()),
                ...widget.employees
                    .map((employee) => SchedulingDailyCalendarColumn(
                        onLocalUpdate: (appointment) {
                          sl<AppointmentScheduleBloc>().add(
                              AppointmentScheduleEventPatchLocal(
                                  appointment: appointment));
                        },
                        onRemoteUpdate: (appointment) {
                          sl<AppointmentScheduleBloc>().add(
                              AppointmentScheduleEventPatch(
                                  appointment: appointment));
                        },
                        onAccept: onAcceptWithBranch(context),
                        date: widget.date,
                        appointments: widget.appointments
                            .where((appointment) =>
                                appointment.employee == employee.id)
                            .toList(),
                        header: employee.name,
                        employeeId: employee.id))
                    .toList()
              ]),
              CurrentTimeRay()
            ])));
  }

  Widget _nobranch() => Container(
        child: Center(child: Text("No branch selected.")),
      );

  @override
  Widget build(BuildContext context) {
    if (widget.employees.isEmpty)
      return _noemployees();
    else if (widget.branch == null) {
      return _nobranch();
    }
    var schedulingContext = SchedulingContextProvider.of(context);

    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      extendBody: true,
      body: Scrollbar(
          controller: schedulingContext.verticalController,
          child: SingleChildScrollView(
            controller: schedulingContext.verticalController,
            child: _horizontal(context),
          )),
    );
  }
}
