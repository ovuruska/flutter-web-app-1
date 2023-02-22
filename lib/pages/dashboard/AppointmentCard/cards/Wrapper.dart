import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/common/dialogs.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/bloc/ticket_information_bloc.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/bloc/ticket_information_event.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_util.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../GestureDetector.dart';

class AppointmentCardWrapper extends StatelessWidget {
  final Appointment appointment;
  final Widget child;

  const AppointmentCardWrapper(
      {Key? key, required this.appointment, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PendingAppointmentGestureDetector(
        appointment: appointment,
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onDoubleTap: () {
              var appointmentId = int.parse(appointment.id);
              sl.get<TicketInformationBloc>().add(FetchAppointment(appointmentId));
              context.push("/appointment/${appointment.id}");
            },
            child: child));
  }
}
