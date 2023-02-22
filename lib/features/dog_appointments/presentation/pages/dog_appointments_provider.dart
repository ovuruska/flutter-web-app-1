import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/dog_appointments/presentation/bloc/dog_appointments_state.dart';

import '../../../../injection.dart';
import '../bloc/dog_appointments_bloc.dart';
import '../bloc/dog_appointments_event.dart';
import '../widgets/loading.dart';
import 'dog_appointments.dart';

class DogAppointmentsProvider extends StatefulWidget {
  final int petId;
  const DogAppointmentsProvider({Key? key, required this.petId})
      : super(key: key);

  @override
  _DogAppointmentsProviderState createState() =>
      _DogAppointmentsProviderState();
}

class _DogAppointmentsProviderState extends State<DogAppointmentsProvider> {
  @override
  void initState() {
    super.initState();
    sl<DogAppointmentsBloc>().add(GetPetAppointments(widget.petId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogAppointmentsBloc, DogAppointmentsState>(
      bloc: sl<DogAppointmentsBloc>(),
      builder: (context, state) {
        if (state is Loading || state is Empty) {
          return LoadingWidget();
        } else if (state is Loaded) {
          return ViewDogAppointments(
              upcomingAppointments: state.upcomingAppointments,
              pastAppointments: state.pastAppointments);
        } else if (state is Error) {
          return Text("Error");
        }
        return Text("Unknown");
      },
    );
  }
}
