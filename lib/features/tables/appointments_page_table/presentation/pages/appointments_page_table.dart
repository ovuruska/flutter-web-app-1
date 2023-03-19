import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/appointments_page_table_bloc.dart';
import '../bloc/appointments_page_table_state.dart';
import '../widgets/data_table.dart';

class AppointmentPagesTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsPageTableBloc, AppointmentsPageTableState>(
        bloc: sl<AppointmentsPageTableBloc>(),
        builder: (context, state) {
          return Scaffold(
            body: DataTableScreen(),
          );
        });
  }
}
