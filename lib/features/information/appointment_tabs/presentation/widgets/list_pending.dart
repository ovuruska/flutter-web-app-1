import 'package:flutter/material.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import 'item_pending.dart';

class AppointmentListPending extends StatelessWidget {

  final List<SchedulingAppointmentEntity> appointments;
  const AppointmentListPending({Key? key, required this.appointments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:ListView.builder(shrinkWrap: true,
            itemCount: appointments.length,
            itemBuilder: (context, index) => AppointmentItemPending(appointment: appointments[index])
        )
    );
  }
}