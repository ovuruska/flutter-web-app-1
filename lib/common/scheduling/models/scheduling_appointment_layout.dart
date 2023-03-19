import 'package:equatable/equatable.dart';

import 'scheduling_appointment_entity.dart';


class SchedulingAppointmentLayout extends Equatable{
  final SchedulingAppointmentEntity appointment;
  final int zIndex;
  double left;
  double right;

  SchedulingAppointmentLayout(
      {this.zIndex = 1, this.left=0,this.right=1,  required this.appointment});

  @override
  List<Object?> get props => [appointment, zIndex, left, right];

  @override
  String toString() {
    return 'AppointmentLayout{appointment: $appointment, zIndex: $zIndex, left: $left, right: $right}';
  }



}
