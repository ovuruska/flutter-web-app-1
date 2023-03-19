

import 'package:equatable/equatable.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../../common/scheduling/models/scheduling_employee_entity.dart';

class DailyColumnState extends Equatable{
  @override
  List<Object?> get props => [];

}
class DailyColumnInitial extends DailyColumnState {}

class DailyColumnLoading extends DailyColumnState {}

class DailyColumnLoaded extends DailyColumnState {
  final DateTime date;
  final List<SchedulingAppointmentEntity> appointments;
  final int target;
  final String employeeName;
  final int employee;

  DailyColumnLoaded({
    required this.date,
    required this.employeeName,
    required this.appointments,
    required this.employee,
    required this.target,
});

  @override
  List<Object?> get props => [date, appointments, target,employeeName,employee];
}

