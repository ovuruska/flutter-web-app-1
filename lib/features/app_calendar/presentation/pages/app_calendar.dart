


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/app_calendar/presentation/bloc/app_calendar_state.dart';

import '../../../../injection.dart';
import '../bloc/app_calendar_bloc.dart';
import '../widgets/app_calendar.dart';

class AppCalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCalendarBloc,AppCalendarState>(
      bloc: sl<AppCalendarBloc>(),
        builder: (context, state) {
        return AppCalendar(date: state.date,);
      },
    );
  }

}