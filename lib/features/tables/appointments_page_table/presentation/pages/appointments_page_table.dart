import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/appointment_data_bloc.dart';
import '../bloc/appointment_data_state.dart';
import '../widgets/data_table.dart';

class AppointmentPagesTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentDataBloc, AppointmentDataState>(
        bloc: sl<AppointmentDataBloc>(),
        builder: (context, state) {
          return Scaffold(
            body: DataTableScreen(),
          );
        });
  }
}
