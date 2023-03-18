import 'package:equatable/equatable.dart';

class ClientYearlyAppointmentsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetClientYearlyAppointmentsEvent extends ClientYearlyAppointmentsEvent {
  final int id;

  GetClientYearlyAppointmentsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
