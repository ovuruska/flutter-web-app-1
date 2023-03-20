import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_bloc.dart';

import '../../../../common/scheduling/default_context.dart';
import '../../../../common/scheduling/scheduling_context_provider.dart';
import '../../../../injection.dart';
import '../bloc/employee_schedule/employee_schedule_bloc.dart';
import '../bloc/employee_schedule/employee_schedule_event.dart';
import '../bloc/employee_schedule/employee_schedule_state.dart';
import '../bloc/schedule_header/schedule_header_state.dart';
import '../widgets/employee_weekly_schedule.dart';

class EmployeeScheduleView extends StatefulWidget {
  final DashboardEmployeeEntity employee;

  const EmployeeScheduleView(
      {Key? key,  required this.employee})
      : super(key: key);

  @override
  _EmployeeScheduleViewState createState() => _EmployeeScheduleViewState();
}



class _EmployeeScheduleViewState extends State<EmployeeScheduleView> {
  void initState() {
    super.initState();
    var date = sl<AppointmentScheduleHeaderBloc>().state.date;
    var start = date.startOfWeek();
    var end = date.endOfWeek();
    sl<EmployeeScheduleBloc>().add(EmployeeScheduleGetAppointmentsEvent(
        id: widget.employee.id, start: start, end: end));

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentScheduleHeaderBloc,AppointmentScheduleHeaderState>(
        bloc: sl<AppointmentScheduleHeaderBloc>(),
        buildWhen: (previous, current) => !previous.date.isSameWeek(current.date),
        builder: (context,headerState) => BlocBuilder<EmployeeScheduleBloc, EmployeeScheduleState>(
              bloc: sl<EmployeeScheduleBloc>(),
              builder: (context, state) {
                if (state is EmployeeScheduleInitial) {
                  return Center(
                    child: Text("No branch is available."),
                  );
                } else if (state is EmployeeScheduleLoaded) {

                  return SchedulingContextProvider(
                      schedulingContext: getDefaultSchedulingContext(),
                      child:EmployeeWeeklySchedule(
                    date: headerState.date,
                    appointments: state.appointments,
                    employee: widget.employee,
                  ));
                } else {
                  return Container();
                }
              },
            ));
  }
}
