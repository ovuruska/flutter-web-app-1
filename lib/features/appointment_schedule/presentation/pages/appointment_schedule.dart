

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../bloc/appointment_schedule_bloc.dart';
import '../bloc/appointment_schedule_event.dart';
import '../bloc/appointment_schedule_state.dart';
import '../widgets/appointment_schedule.dart';

class AppointmentScheduleView extends StatefulWidget {
  final DateTime date;
  final int branch;

  AppointmentScheduleView({
    required this.date,
    required this.branch,
});

  @override
  _AppointmentScheduleViewState createState() => _AppointmentScheduleViewState();
}

class _AppointmentScheduleViewState extends State<AppointmentScheduleView> {

  void initState() {
    super.initState();
    sl<AppointmentScheduleBloc>().add(AppointmentScheduleGetEmployeesEvent(date: widget.date,branch: widget.branch));
    sl<AppointmentScheduleBloc>().add(AppointmentScheduleGetAppointmentsEvent(date: widget.date,branch: widget.branch));

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentScheduleBloc,AppointmentScheduleState>(
      bloc: sl<AppointmentScheduleBloc>(),
      builder: (context, state) {
        if(state is Initial){
          return Center(child: CircularProgressIndicator(),);
        }else if(state is Loaded) {
          return AppointmentSchedule(
            date: widget.date,
            branch: widget.branch,
            employees: state.employees,
            appointments: state.appointments,
          );
        }else{
          return Container();
        }
      },


    );
  }
}

