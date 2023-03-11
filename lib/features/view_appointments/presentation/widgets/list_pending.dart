

import 'package:flutter/material.dart';

import '../../../../widgets/cards/root/entity.dart';
import 'item_pending.dart';

class AppointmentListPending extends StatelessWidget {

  final List<DashboardAppointmentEntity> appointments;
  const AppointmentListPending({Key? key, required this.appointments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:ListView.builder(shrinkWrap: true,
            itemCount: appointments.length,
            itemBuilder: (context, index) => AppointmentItemWaitlist(appointment: appointments[index])
        )
    );
  }
}