import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/employee_schedule/employee_schedule_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/schedule_header_dropdown/schedule_header_dropdown_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/rebook_appointment_2/presentation/bloc/rebook_appointment_2_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/select_client_pets/presentation/bloc/select_client_pets_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/select_client_pets/presentation/bloc/select_client_pets_event.dart';
import 'package:scrubbers_employee_application/features/ticket_information/presentation/widgets/appointment_context_provider.dart';
import 'package:scrubbers_employee_application/features/ticket_information/utils/conversion.dart';

import '../../../../../../core/domain/usecases/patch_appointment.dart';
import '../../../../../../injection.dart';
import '../../../../../../pages/schedule/schedule_page_context.dart';
import '../../../../../appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../../../../../appointment_schedule/presentation/bloc/employee_schedule/employee_schedule_bloc.dart';
import '../../../../../forms/rebook_appointment_2/presentation/bloc/rebook_appointment_2_event.dart';
import '../../../../utils/style.dart';

class TicketInformationCheckinButtonGroup extends StatelessWidget {
  closeTicket(BuildContext context) {
    var appointment = AppointmentContextProvider.of(context).appointment;
    var notifier = AppointmentContextProvider.of(context).notifier!;
    notifier.setStatus("Completed");
    patch(appointment.update(status: "Completed"));
  }

  patch(AppointmentEntity appointment) {
    var schedulingAppointment = appointment.toSchedulingAppointmentEntity();
    var params =
        PatchAppointmentParams(appointment.toSchedulingAppointmentEntity());
    sl<PatchAppointmentUseCase>().call(params);
    if (sl<ScheduleHeaderDropdownBloc>().isEmployee()) {
      sl<EmployeeScheduleBloc>().add(
          EmployeeScheduleLocalPatchEvent(appointment: schedulingAppointment));
    } else {
      sl<AppointmentScheduleBloc>().add(AppointmentScheduleEventPatchLocal(
          appointment: schedulingAppointment));
    }
  }

  onSaved(BuildContext context) {
    var notifier = AppointmentContextProvider.of(context).notifier!;
    var appointment = notifier.appointment;
    patch(appointment);
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
                  SelectClientPetsEventFetchClientPets(
                      id: appointment.customer.id),
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
