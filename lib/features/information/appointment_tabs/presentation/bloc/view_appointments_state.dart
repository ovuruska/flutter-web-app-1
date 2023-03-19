import 'package:equatable/equatable.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';



class ViewAppointmentsState extends Equatable {
  const ViewAppointmentsState();

  @override
  List<Object> get props => [];
}

class Initial extends ViewAppointmentsState {}

class Loaded extends ViewAppointmentsState {
  final List<SchedulingAppointmentEntity> waitlistAppointments;
  final List<SchedulingAppointmentEntity> cancelledAppointments;
  final List<SchedulingAppointmentEntity> pendingAppointments;

  Loaded({
    this.waitlistAppointments = const [],
    this.cancelledAppointments = const [],
    this.pendingAppointments = const [],
  });

  setCancelledAppointments(List<SchedulingAppointmentEntity> appointments) {
    return Loaded(
      cancelledAppointments: appointments,
      pendingAppointments: pendingAppointments,
      waitlistAppointments: waitlistAppointments,
    );
  }

  setPendingAppointments(List<SchedulingAppointmentEntity> appointments) {
    return Loaded(
      cancelledAppointments: cancelledAppointments,
      pendingAppointments: appointments,
      waitlistAppointments: waitlistAppointments,
    );
  }

  setWaitlistAppointments(List<SchedulingAppointmentEntity> appointments) {
    return Loaded(
      cancelledAppointments: cancelledAppointments,
      pendingAppointments: pendingAppointments,
      waitlistAppointments: appointments,
    );
  }

  @override
  List<Object> get props =>
      [waitlistAppointments.length, cancelledAppointments.length, pendingAppointments.length];
}
