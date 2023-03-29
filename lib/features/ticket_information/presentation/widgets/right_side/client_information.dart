import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/bloc/client_details/client_details_bloc.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/bloc/client_details/client_details_state.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/widgets/appointment_context_provider.dart';
import 'package:scrubbers_employee_application/injection.dart';
import 'package:scrubbers_employee_application/widgets/headless_table.dart';

import '../../../utils/contants.dart';

class TicketInformationClientDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appointment = AppointmentContextProvider.of(context).appointment;

    return BlocBuilder<TicketInformationClientDetailsBloc,
        TicketInformationClientDetailsState>(
      bloc: sl<TicketInformationClientDetailsBloc>(),
      builder: (context, state) {
        if (state is TicketInformationClientDetailsStateLoaded) {
          var lifetimeInvoice = state.clientDetails.lifetimeProductSales +
              state.clientDetails.lifetimeServiceSales +
              state.clientDetails.lifetimeTips;
          var petString =
              state.clientDetails.pets.map((pet) => pet.name).join(", ");
          return HeadlessDataTable(
            numberOfColumns: 2,
            rows: [
              DataRow(cells: [
                boldCell("Name"),
                normalCell(StringUtils.capitalize(appointment.customer.name)),
              ]),
              DataRow(cells: [
                boldCell("Lifetime invoice"),
                normalCell("\$${lifetimeInvoice.toStringAsFixed(2)}"),
              ]),
              DataRow(cells: [
                boldCell("Pets"),
                normalCell(petString),
              ]),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }


}
