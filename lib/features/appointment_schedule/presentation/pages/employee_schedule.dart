import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';

import '../../../../injection.dart';
import '../bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../bloc/branch_schedule/appointment_schedule_state.dart';
import '../bloc/employee_schedule/employee_schedule_bloc.dart';
import '../bloc/employee_schedule/employee_schedule_event.dart';
import '../bloc/employee_schedule/employee_schedule_state.dart';
import '../widgets/schedule/employee_weekly_schedule.dart';

class EmployeeScheduleView extends StatefulWidget {
  final DateTime date;
  final DashboardEmployeeEntity employee;

  const EmployeeScheduleView(
      {Key? key, required this.date, required this.employee})
      : super(key: key);

  @override
  _EmployeeScheduleViewState createState() => _EmployeeScheduleViewState();
}

class _EmployeeScheduleViewState extends State<EmployeeScheduleView> {
  void initState() {
    super.initState();
    var start = widget.date.startOfWeek();
    var end = widget.date.endOfWeek();
    sl<EmployeeScheduleBloc>().add(EmployeeScheduleGetAppointmentsEvent(
        id: widget.employee.id, start: start, end: end));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeScheduleBloc, EmployeeScheduleState>(
              bloc: sl<EmployeeScheduleBloc>(),
              builder: (context, state) {
                if (state is EmployeeScheduleInitial) {
                  return Center(
                    child: Text("No branch is available."),
                  );
                } else if (state is EmployeeScheduleLoaded) {

                  return EmployeeWeeklySchedule(
                    date: widget.date,
                    appointments: state.appointments,
                    employee: widget.employee,
                  );
                } else {
                  return Container();
                }
              },
            );
  }
}
