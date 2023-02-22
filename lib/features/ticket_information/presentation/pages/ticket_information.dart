import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/dog_appointments/presentation/pages/dog_appointments_provider.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/bloc/bloc.dart';

import '../../../../injection.dart';
import '../bloc/ticket_information_bloc.dart';
import '../bloc/ticket_information_state.dart';
import '../widgets/loading.dart';

export 'ticket_information.dart';

class TicketInformationPage extends StatefulWidget {
  final int appointmentId;

  const TicketInformationPage({Key? key, required this.appointmentId})
      : super(key: key);

  @override
  _TicketInformationPageState createState() => _TicketInformationPageState();
}

class _TicketInformationPageState extends State<TicketInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Information'),
        centerTitle: true,
      ),
      body: buildBody(context),
    );
  }

  @override
  void initState() {
    super.initState();
    sl<TicketInformationBloc>().add(FetchAppointment(widget.appointmentId));
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<TicketInformationBloc, TicketInformationState>(
      bloc: sl<TicketInformationBloc>(),
      builder: (context, state) {
        if (state is Loading || state is Empty) {
          return LoadingWidget();
        } else if (state is Loaded) {
          var appointment = state.appointment;
          return DogAppointmentsProvider(petId: appointment.dog.id,);
        } else if (state is Error) {
          return Text("Error");
        }
        return Text("Unknown");
      },
    );
  }
}
