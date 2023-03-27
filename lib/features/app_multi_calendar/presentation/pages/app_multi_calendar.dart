


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/app_multi_calendar/presentation/bloc/app_multi_calendar_bloc.dart';

import '../../../../injection.dart';
import '../bloc/app_multi_calendar_state.dart';
import '../widgets/app_multi_calendar.dart';

class AppMultiCalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppMultiCalendarBloc,AppMultiCalendarState>(
      bloc: sl<AppMultiCalendarBloc>(),
      builder: (context, state) {
        return AppMultiCalendar(date: state.date,);
      },
    );
  }

}