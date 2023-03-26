import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/scheduling/scheduling_context_provider.dart';

import '../../../../../common/scheduling/cards/pending.dart';
import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../../injection.dart';
import '../bloc/view_appointments_bloc.dart';
import '../bloc/view_appointments_event.dart';

class AppointmentItemWaitlist extends StatelessWidget {
  SchedulingAppointmentEntity appointment;

  AppointmentItemWaitlist({required this.appointment});

  Widget _build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy/MM/dd h:mm a').format(appointment.start);
    return ListTile(
      mouseCursor: SystemMouseCursors.grab,
      title: Row(
        children: [
          Text(
            appointment.customerName,
            style: FlutterFlowTheme.of(context).title4,
          ),
          (appointment.specialHandling)
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.star,
                    color: const Color(0xFFFF5B5B),
                    size: 16,
                  ))
              : Container()
        ],
      ),
      subtitle: Text(
        '${formattedDate} | ${appointment.service}',
        style: FlutterFlowTheme.of(context).subtitle3,
      ),
      tileColor: Color(0xFFF5F5F5),
      dense: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    var draggedAppointment = appointment.copyWith(status: "Pending");
    var schedulingContext = SchedulingContextProvider.of(context);

    return Draggable<SchedulingAppointmentEntity>(
      data: draggedAppointment,
      child: _build(context),
      hitTestBehavior: HitTestBehavior.translucent,
      ignoringFeedbackPointer: true,
    onDragCompleted: (){
        var appointmentId = appointment.id;
        var event = RemoveWaitlistAppointmentEvent(appointment: appointmentId);
      sl<ViewAppointmentsBloc>().add(event);
    },
      feedback: SchedulingContextProvider(
          schedulingContext: schedulingContext,
          child:Opacity(
          opacity: .5,
          child: GestureDetector(
              behavior: HitTestBehavior.deferToChild,
              child: AppointmentCardPending(
                appointment: draggedAppointment,
              )))),
      childWhenDragging: Container(),
    );
  }
}
