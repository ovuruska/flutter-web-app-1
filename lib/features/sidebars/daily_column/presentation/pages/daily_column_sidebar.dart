import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/scheduling/scheduling_context_provider.dart';

import '../../../../../common/scheduling/default_context.dart';
import '../../../../../injection.dart';
import '../bloc/daily_column_bloc.dart';
import '../bloc/daily_column_state.dart';
import '../widgets/daily_column_sidebar.dart';

class DailyColumnSidebarView extends StatelessWidget {
  _withProvider(Widget child) => SchedulingContextProvider(
      child: child, schedulingContext: defaultContext);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyColumnBloc, DailyColumnState>(
      bloc: sl<DailyColumnBloc>(),
      builder: (context, state) {
        if (state is DailyColumnLoaded) {
          return _withProvider(DailyColumnSidebar(
            date: state.date,
            appointments: state.appointments,
            employee: state.employee,
            target: state.target,
            employeeName: state.employeeName,
          ));
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
          );
        }
      },
    );
  }
}
