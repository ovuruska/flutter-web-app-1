import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/bloc/upcoming_appointments/upcoming_appointments_bloc.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/bloc/upcoming_appointments/upcoming_appointments_state.dart';

import '../../../../../../injection.dart';
import 'card_list.dart';


class TicketInformationUpcomingView extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    return BlocBuilder<TicketInformationUpcomingAppointmentsBloc,TicketInformationUpcomingAppointmentsState>(
      bloc:sl<TicketInformationUpcomingAppointmentsBloc>(),
      builder:(context, state){
        if(state is TicketInformationUpcomingAppointmentsStateLoaded){
          var appointments = state.appointments;
          return Column(
            children: [
              Expanded(child: TicketInformationUpcomingCardList(appointments: appointments)),
              Divider(color: Color(0xFFD9D9D9), height: 1,indent:16,endIndent: 16,),
            ],
          );
        }else{
          return Container();
        }
      }
    );
  }
}

