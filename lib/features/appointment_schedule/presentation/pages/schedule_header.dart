import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../bloc/schedule_header/schedule_header_bloc.dart';
import '../bloc/schedule_header/schedule_header_state.dart';
import '../widgets/schedule_header.dart';

class ScheduleHeaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentScheduleHeaderBloc, ScheduleHeaderState>(
      bloc: sl<AppointmentScheduleHeaderBloc>(),
      builder: (context, state) {
        var date = state.date;
        return ScheduleHeader(date: date);
      },
    );
  }
}
