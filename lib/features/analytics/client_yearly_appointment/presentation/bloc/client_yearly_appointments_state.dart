

import 'package:equatable/equatable.dart';

import '../../domain/entities/monthly_appointment_costs.dart';

class ClientYearlyAppointmentsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ClientYearlyAppointmentInitial extends ClientYearlyAppointmentsState {}

class ClientYearlyAppointmentLoading extends ClientYearlyAppointmentsState {}

class ClientYearlyAppointmentLoaded extends ClientYearlyAppointmentsState {
  final Map<String, MonthlyAppointmentCosts> data;

  ClientYearlyAppointmentLoaded(this.data);

  @override
  List<Object?> get props => [data];
}