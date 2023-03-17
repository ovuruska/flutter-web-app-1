import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_state.dart';

import '../../../../injection.dart';
import '../bloc/appointment_schedule/appointment_schedule_bloc.dart';
import '../bloc/appointment_schedule/appointment_schedule_state.dart';
import '../widgets/appointment_schedule.dart';

class AppointmentScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentScheduleHeaderBloc, ScheduleHeaderState>(
        bloc: sl<AppointmentScheduleHeaderBloc>(),
        builder: (context, headerState) {
          return BlocBuilder<AppointmentScheduleBloc, AppointmentScheduleState>(
            bloc: sl<AppointmentScheduleBloc>(),
            builder: (context, state) {
              if (state is Initial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loaded) {
                return AppointmentSchedule(
                  date: headerState.date,
                  branch: headerState.branch,
                  employees: state.employees,
                  appointments: state.appointments,

                );

              } else {
                return Container();
              }
            },
          );
        });
  }
}
