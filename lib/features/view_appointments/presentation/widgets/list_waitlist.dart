import 'package:flutter/material.dart';

import '../../../../widgets/cards/root/entity.dart';
import 'item_waitlist.dart';

class AppointmentListWaitlist extends StatelessWidget {
  final List<DashboardAppointmentEntity> appointments;
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
