import 'package:flutter/material.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import 'item_waitlist.dart';

class AppointmentListWaitlist extends StatelessWidget {
  final List<SchedulingAppointmentEntity> appointments;
  const AppointmentListWaitlist({Key? key, required this.appointments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: appointments
          .map((e) => AppointmentItemWaitlist(appointment: e))
          .toList(),
    );
  }
}
