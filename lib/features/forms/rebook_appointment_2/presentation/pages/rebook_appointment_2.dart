import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/injection.dart';

import '../bloc/rebook_appointment_2_bloc.dart';
import '../bloc/rebook_appointment_2_state.dart';
import '../widgets/form_column.dart';

class RebookAppointment2View extends StatelessWidget {
  const RebookAppointment2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RebookAppointment2Bloc, RebookAppointment2State>(
        bloc: sl<RebookAppointment2Bloc>(),
        builder: (context, state) {
          RebookAppointment2FormColumn form;
          if (state is RebookAppointment2StateInitial) {
            form = RebookAppointment2FormColumn(
              startDate: state.startDate,
              groomers: state.groomers,
              service: state.service,
              duration: state.duration,
              client: state.client,
              branches: state.branches,
            );
          } else {
            form = RebookAppointment2FormColumn();
          }

          return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  child: form));
        });
  }
}
