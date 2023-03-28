

import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/client_details.dart';

class TicketInformationClientDetailsState extends Equatable {
  const TicketInformationClientDetailsState();

  @override
  List<Object?> get props => [];
}

class TicketInformationClientDetailsStateError extends TicketInformationClientDetailsState {}

class TicketInformationClientDetailsStateLoading extends TicketInformationClientDetailsState {}

class TicketInformationClientDetailsStateLoaded extends TicketInformationClientDetailsState {
  final ClientDetails clientDetails;

  const TicketInformationClientDetailsStateLoaded({required this.clientDetails});

  @override
  List<Object?> get props => [clientDetails];
}