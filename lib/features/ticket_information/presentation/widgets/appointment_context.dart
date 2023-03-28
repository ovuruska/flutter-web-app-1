

import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';

class AppointmentContext extends Equatable{
  final AppointmentEntity appointment;

  AppointmentContext({required this.appointment});

  @override
  List<Object?> get props => [appointment];
}