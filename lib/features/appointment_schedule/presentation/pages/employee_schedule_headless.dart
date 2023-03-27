import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_bloc.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_state.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_state.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';

import '../../../../injection.dart';
import '../bloc/employee_schedule/employee_schedule_bloc.dart';
import '../bloc/employee_schedule/employee_schedule_event.dart';
import '../bloc/employee_schedule/employee_schedule_state.dart';
import '../widgets/employee_weekly_schedule.dart';

class EmployeeScheduleHeadlessView extends StatefulWidget {
  final DashboardEmployeeEntity employee;

  const EmployeeScheduleHeadlessView(
      {Key? key,  required this.employee})
      : super(key: key);

  @override
  _EmployeeScheduleHeadlessViewState createState() => _EmployeeScheduleHeadlessViewState();
}



class _EmployeeScheduleHeadlessViewState extends State<EmployeeScheduleHeadlessView> {
  void initState() {
    super.initState();
    var date = sl<AppMultiCalendarBloc>().state.date;
    var start = date.startOfWeek();
    var end = date.endOfWeek();
    sl<EmployeeScheduleBloc>().add(EmployeeScheduleGetAppointmentsEvent(
        id: widget.employee.id, start: start, end: end));

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppMultiCalendarBloc, AppMultiCalendarState>(
        buildWhen: (previous, current) =>
    !previous.date.isSameWeek(current.date),
    bloc: sl<AppMultiCalendarBloc>(),
    builder: (context, calendarState) =>
    BlocBuilder<AppSelectBranchBloc, AppSelectBranchState>(
    bloc: sl<AppSelectBranchBloc>(),
        builder: (context,headerState) => BlocBuilder<EmployeeScheduleBloc, EmployeeScheduleState>(
          bloc: sl<EmployeeScheduleBloc>(),
          builder: (context, state) {
            if (state is EmployeeScheduleInitial) {
              return Center(
                child: Text("No branch is available."),
              );
            } else if (state is EmployeeScheduleLoaded) {

              return EmployeeWeeklySchedule(
                    date: calendarState.date,
                    appointments: state.appointments,
                    employee: widget.employee,
                  );
            } else {
              return Container();
            }
          },
        )));
  }
}
