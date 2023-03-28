

import 'package:equatable/equatable.dart';

class TicketInformationClientDetailsEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class TicketInformationClientDetailsEventFetch extends TicketInformationClientDetailsEvent{
  final int id;

  TicketInformationClientDetailsEventFetch({required this.id});

  @override
  List<Object?> get props => [id];
}