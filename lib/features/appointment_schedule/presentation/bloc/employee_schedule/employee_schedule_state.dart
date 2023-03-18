import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/widgets/cards/root/entity.dart';

class EmployeeScheduleState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmployeeScheduleInitial extends EmployeeScheduleState {}

class EmployeeScheduleLoading extends EmployeeScheduleState {}

class EmployeeScheduleLoaded extends EmployeeScheduleState {

  final List<DashboardAppointmentEntity> appointments;

  EmployeeScheduleLoaded({this.appointments = const []});

  @override
  List<Object?> get props => [appointments];
}
