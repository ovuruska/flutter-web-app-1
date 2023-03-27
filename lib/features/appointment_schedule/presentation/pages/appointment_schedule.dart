import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/scheduling/default_context.dart';
import '../../../../common/scheduling/scheduling_context_provider.dart';
import '../../../../injection.dart';
import '../bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../bloc/branch_schedule/appointment_schedule_event.dart';
import '../bloc/branch_schedule/appointment_schedule_state.dart';
import '../widgets/appointment_schedule.dart';
import 'appointment_schedule_headless.dart';

class AppointmentScheduleView extends StatelessWidget {
  final int? branch;
  final DateTime date;
  final String? role;

  const AppointmentScheduleView({Key? key, this.branch, required this.date, this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SchedulingContextProvider(
        schedulingContext: getDefaultSchedulingContext(),
        child: AppointmentScheduleHeadlessView(
          branch: branch,
          date: date,
          role: role,
        ));
  }
}
