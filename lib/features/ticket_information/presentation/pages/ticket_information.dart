
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/widgets/appointment_context_provider.dart';
import 'package:scrubbers_employee_application/injection.dart';

import '../bloc/ticket_information/ticket_information_bloc.dart';
import '../bloc/ticket_information/ticket_information_state.dart';
import '../widgets/appointment_context.dart';
import '../widgets/ticket_information.dart';

class TicketInformationView extends StatefulWidget {
  const TicketInformationView({Key? key}) : super(key: key);



  @override
  _TicketInformationViewState createState() => _TicketInformationViewState();
}
class _TicketInformationViewState extends State<TicketInformationView> {


  @override
  Widget build(BuildContext context) {


    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: _build(context)
    );
  }

  Widget _build(BuildContext context) {
    return BlocBuilder<TicketInformationBloc, TicketInformationState>(
        bloc:sl<TicketInformationBloc>(),
        builder: (context, state) {
          if (state is TicketInformationStateLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TicketInformationStateError) {
            return Center(child: Text("Error"));
          } else if (state is TicketInformationStateLoaded) {
            var appointment = state.appointment;
            return AppointmentContextProvider(child: TicketInformation(
              appointment: appointment,
            ), appointmentContext: AppointmentContext(appointment: appointment,));
          } else {
            return Center(child: Text("Unknown"));
          }

        });
  }

}