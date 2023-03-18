import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/client_appointments_bloc.dart';
import '../bloc/client_appointments_state.dart';
import '../widgets/client_appointments_loaded.dart';

class ClientAppointmentsView extends StatefulWidget {
  const ClientAppointmentsView({Key? key}) : super(key: key);

  @override
  _ClientAppointmentsViewState createState() => _ClientAppointmentsViewState();
}
class _ClientAppointmentsViewState extends State<ClientAppointmentsView> {


  Widget build(BuildContext context){
    return BlocBuilder<ClientAppointmentsBloc,ClientAppointmentsState>(
      bloc:sl<ClientAppointmentsBloc>(),
      builder: (context,state){
        if(state is Initial){
          return Container(
            child:Center(
              child: Text("No Appointments"),
            )
          );
        }else if(state is Loaded){
          var loadedState = state as Loaded;
          var appointments = loadedState.appointments;
          return ClientAppointmentsLoaded(appointments: appointments);
        }else if(state is Loading){
          return Container(
            child:Center(
              child: CircularProgressIndicator(),
            )
          );
        }
        else{
          return Container();
        }
      },

    );
  }


}