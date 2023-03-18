import 'package:equatable/equatable.dart';

import '../../../../../widgets/cards/root/entity.dart';



class ViewAppointmentsState extends Equatable {
  const ViewAppointmentsState();

  @override
  List<Object> get props => [];
}

class Initial extends ViewAppointmentsState {}

class Loaded extends ViewAppointmentsState {
  final List<DashboardAppointmentEntity> waitlistAppointments;
  final List<DashboardAppointmentEntity> cancelledAppointments;
  final List<DashboardAppointmentEntity> pendingAppointments;

  Loaded({
    this.waitlistAppointments = const [],
    this.cancelledAppointments = const [],
    this.pendingAppointments = const [],
  });

  setCancelledAppointments(List<DashboardAppointmentEntity> appointments) {
    return Loaded(
      cancelledAppointments: appointments,
      pendingAppointments: pendingAppointments,
      waitlistAppointments: waitlistAppointments,
    );
  }

  setPendingAppointments(List<DashboardAppointmentEntity> appointments) {
    return Loaded(
      cancelledAppointments: cancelledAppointments,
      pendingAppointments: appointments,
      waitlistAppointments: waitlistAppointments,
    );
  }

  setWaitlistAppointments(List<DashboardAppointmentEntity> appointments) {
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
