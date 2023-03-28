import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/bloc/ticket_information_bloc.dart';
import 'package:scrubbers_employee_application/injection.dart';

import '../presentation/bloc/ticket_information_event.dart';
import '../presentation/pages/ticket_information.dart';

Future<void> showTicketInformationDialog(
    BuildContext context, int appointmentId) async {

  sl<TicketInformationBloc>().add(TicketInformationEventFetch(id: appointmentId));

  return showDialog(
    context: context,
    builder: (context) {
      return TicketInformationView();
    },
  );
}