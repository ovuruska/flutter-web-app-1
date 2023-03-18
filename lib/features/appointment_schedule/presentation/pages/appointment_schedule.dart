import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';

import '../../../../injection.dart';
import '../bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../bloc/branch_schedule/appointment_schedule_state.dart';
import '../widgets/schedule/appointment_schedule.dart';

class AppointmentScheduleView extends StatefulWidget {
  final int? branch;
  final DateTime date;
  final String? role;


  const AppointmentScheduleView({Key? key, this.branch,this.role, required this.date})
      : super(key: key);

  @override
  AppointmentScheduleViewState createState() => AppointmentScheduleViewState();
}

class AppointmentScheduleViewState extends State<AppointmentScheduleView> {
  @override
  void initState() {
    super.initState();
    if(widget.branch != null) {
      var branch = widget.branch!;
      sl<AppointmentScheduleBloc>().add(AppointmentScheduleGetAppointmentsEvent(
          branch: branch, date: widget.date));
      sl<AppointmentScheduleBloc>().add(AppointmentScheduleGetEmployeesEvent(
          date: widget.date, branch: branch));
    }

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentScheduleBloc, AppointmentScheduleState>(
      bloc: sl<AppointmentScheduleBloc>(),
      builder: (context, state) {
        if (widget.branch == null) {
          return Center(
            child: Text("No branch is available."),
          );
        } else if (state is AppointmentScheduleStateLoaded) {
          var employees = state.employees;
          if(widget.role != null) employees = employees.where((element) => element.role == widget.role).toList();

          return AppointmentSchedule(
            branch: widget.branch,
            date: widget.date,
            employees: employees,
            appointments: state.appointments,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
