

import 'package:equatable/equatable.dart';

class ViewAppointmentsEvent extends Equatable {
  const ViewAppointmentsEvent();

  @override
  List<Object> get props => [];
}

class GetWaitlistAppointmentsEvent extends ViewAppointmentsEvent {}

class GetCancelledAppointmentsEvent extends ViewAppointmentsEvent {}

class GetPendingAppointmentsEvent extends ViewAppointmentsEvent {}