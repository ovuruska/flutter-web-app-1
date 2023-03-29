import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';
import 'package:scrubbers_employee_application/features/forms/client_autocomplete/presentation/bloc/client_autocomplete_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/client_autocomplete/presentation/widgets/client_autocomplete.dart';
import 'package:scrubbers_employee_application/features/forms/rebook_appointment_2/presentation/bloc/rebook_appointment_2_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/select_client_pets/presentation/bloc/select_client_pets_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/select_client_pets/presentation/bloc/select_client_pets_event.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/widgets/appointment_context_provider.dart';

import '../../../../../../core/domain/usecases/patch_appointment.dart';
import '../../../../../../injection.dart';
import '../../../../../../pages/schedule/schedule_page_context.dart';
import '../../../../../forms/client_autocomplete/domain/callbacks/client_autocomplete_client_selected.dart';
import '../../../../../forms/client_autocomplete/presentation/bloc/client_autocomplete_event.dart';
import '../../../../../forms/rebook_appointment_2/presentation/bloc/rebook_appointment_2_event.dart';
import '../../../../utils/style.dart';

class TicketInformationCheckinButtonGroup extends StatelessWidget {
  closeTicket(BuildContext context) {
    var notifier = AppointmentContextProvider.of(context).notifier;
    notifier?.setStatus("Completed");
  }

  onSaved(BuildContext context) {
    var notifier = AppointmentContextProvider.of(context).notifier!;
    var appointment = notifier.appointment;
    var params = PatchAppointmentParams(
      SchedulingAppointmentEntity(
        id: appointment.id,
        status: appointment.status,
        customerName: appointment.customer.name,
        employee: appointment.employee.id,
        service: appointment.service,
        breed: appointment.pet.breed,
        dogName: appointment.pet.name,
        start: appointment.start,
        end: appointment.end,
        employeeName: appointment.employee.name,
        branch: appointment.branch.id,
        specialHandling: appointment.specialHandling,
        branchName: appointment.branch.name,
        invoice: 0,
      ),
    );
    sl<PatchAppointmentUseCase>().call(params);
  }

  isSame(BuildContext context) {
    var notifier = AppointmentContextProvider.of(context).notifier;
    var appointment = AppointmentContextProvider.of(context).appointment;
    return notifier?.appointment == appointment;
  }

  isCompleted(BuildContext context) {
    var appointment = AppointmentContextProvider.of(context).appointment;
    return appointment.status == "Completed";
  }

  @override
  Widget build(BuildContext context) {
    var appointment = AppointmentContextProvider.of(context).appointment;

    var notifier = AppointmentContextProvider.of(context).notifier;
    bool disabled = notifier?.appointment == appointment;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getStyledButton(
            disabled: isCompleted(context),
            text: "Close Ticket",
            onPressed: () {
              closeTicket(context);
            }),
        getStyledButton(
            text: (isCompleted(context)) ? "Rebook" : "Close & Rebook",
            onPressed: () async {
              closeTicket(context);
              context.pushNamed("Dashboard");
              await Future.delayed(Duration(milliseconds: 100), () {
                getItMaybe<SchedulePageContext>()?.setSelectedIndex(2);
              });
              await Future.delayed(Duration(milliseconds: 500), () {
                sl<RebookAppointment2Bloc>().add(RebookAppointment2EventSet(
                  client: appointment.customer,
                ));
                sl<SelectClientPetsBloc>().add(
                  SelectClientPetsEventCleared(),
                );
                sl<SelectClientPetsBloc>().add(
                  SelectClientPetsEventFetchClientPets(id: appointment.customer.id),
                );
              });

            }),
        getStyledButton(
            disabled: isSame(context) || isCompleted(context),
            text: "Save Changes",
            onPressed: () {
              onSaved(context);
            }),
      ],
    );
  }
}
