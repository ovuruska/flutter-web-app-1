import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../injection.dart';
import '../../../bloc/prior_appointments/prior_appointments_bloc.dart';
import '../../../bloc/prior_appointments/prior_appointments_state.dart';
import 'card_list.dart';

class TicketInformationPastAppointmentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketInformationPriorAppointmentsBloc,
            TicketInformationPriorAppointmentsState>(
        bloc: sl<TicketInformationPriorAppointmentsBloc>(),
        builder: (context, state) {
          if (state is TicketInformationPriorAppointmentsStateLoaded) {
            var appointments = state.appointments;
            return Column(
              children: [
                Expanded(
                    child: TicketInformationPastCardList(
                  appointments: appointments,
                )),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
