import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/view_appointments_bloc.dart';
import '../bloc/view_appointments_event.dart';
import '../bloc/view_appointments_state.dart';
import '../widgets/view_appointments.dart';
import '../widgets/view_appointments_loading_state.dart';

class ViewAppointmentsPage extends StatefulWidget {
  @override
  _ViewAppointmentsPageState createState() => _ViewAppointmentsPageState();
}

class _ViewAppointmentsPageState extends State<ViewAppointmentsPage> {
  @override
  void initState() {
    super.initState();
    sl<ViewAppointmentsBloc>().add(GetWaitlistAppointmentsEvent());
    sl<ViewAppointmentsBloc>().add(GetPendingAppointmentsEvent());
    sl<ViewAppointmentsBloc>().add(GetCancelledAppointmentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAppointmentsBloc, ViewAppointmentsState>(
      bloc: sl<ViewAppointmentsBloc>(),
      builder: (context, state) {

        if (state is Initial) {
          return ViewAppointmentsLoadingState();
        } else if(state is Loaded){
          var stateAsLoaded = state;
          return ViewAppointments(
            pendingAppointments: stateAsLoaded.pendingAppointments,
            waitlistAppointments: stateAsLoaded.waitlistAppointments,
            cancelledAppointments: stateAsLoaded.cancelledAppointments,
          );
        }else{
          return ViewAppointments(
            pendingAppointments: [],
            waitlistAppointments: [],
            cancelledAppointments: [],
          );
        }
      },
    );
  }
}
