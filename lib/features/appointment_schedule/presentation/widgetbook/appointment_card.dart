import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;

import '../../../../widgets/cards/approved.dart';
import '../../../../widgets/cards/cancelled.dart';
import '../../../../widgets/cards/completed.dart';
import '../../../../widgets/cards/in_progress.dart';
import '../../../../widgets/cards/pending.dart';
import '../../../../widgets/cards/root/entity.dart';

final appointment = DashboardAppointmentEntity(
  id: 1,
  employeeName: 'employeeName',
  customerName: 'customerName',
  employee: 1,
  service: 'service',
  breed: 'breed',
  dogName: 'dogName',
  start: DateTime.now(),
  end: DateTime.now(),
  invoice: 0.0,
  specialHandling: true,
  status: 'CheckedIn',
);
// AppointmentCardInProgress
@WidgetbookUseCase(
    name: 'Appointment Card In Progress', type: AppointmentCardInProgress)
Widget appointmentCardInProgressUseCase(BuildContext context) {
  // Generate some dummy data

  return AppointmentCardInProgress(
    appointment: appointment,
  );
}

// AppointmentCardApproved
@WidgetbookUseCase(
    name: 'Appointment Card Approved', type: AppointmentCardApproved)
Widget appointmentCardApprovedUseCase(BuildContext context) {
  // Generate some dummy data

  return AppointmentCardApproved(
    appointment: appointment,
  );
}

// AppointmentCardCancelled
@WidgetbookUseCase(
    name: 'Appointment Card Cancelled', type: AppointmentCardCancelled)
Widget appointmentCardCancelledUseCase(BuildContext context) {
  // Generate some dummy data

  return AppointmentCardCancelled(
    appointment: appointment,
  );
}

// AppointmentCardPending
@WidgetbookUseCase(
    name: 'Appointment Card Pending', type: AppointmentCardPending)
Widget appointmentCardPendingUseCase(BuildContext context) {
  // Generate some dummy data

  return AppointmentCardPending(
    appointment: appointment,
  );
}

// AppointmentCardCompleted
@WidgetbookUseCase(
    name: 'Appointment Card Completed', type: AppointmentCardCompleted)
Widget appointmentCardCompletedUseCase(BuildContext context) {
  // Generate some dummy data

  return AppointmentCardCompleted(
    appointment: appointment,
  );
}
