import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/client_yearly_appointments_bloc.dart';
import '../bloc/client_yearly_appointments_state.dart';
import '../widgets/client_yearly_appointments.dart';

class ClientYearlyAppointmentsView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientYearlyAppointmentsBloc, ClientYearlyAppointmentsState>(
      bloc:sl<ClientYearlyAppointmentsBloc>(),
      builder: (context, state) {
       if (state is ClientYearlyAppointmentLoaded) {
          return ClientYearlyAppointments(data: state.data);
        } else {
          return Container();
        }
      },
    );
  }

}