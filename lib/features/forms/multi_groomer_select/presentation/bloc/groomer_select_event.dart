

import 'package:equatable/equatable.dart';

class GroomerSelectEvent extends Equatable {
  const GroomerSelectEvent();

  @override
  List<Object> get props => [];
}

class GroomerSelectEventChanged extends GroomerSelectEvent {
  final String query;

  const GroomerSelectEventChanged({required this.query});

  @override
  List<Object> get props => [query];
}

class GroomerSelectEventFetch extends GroomerSelectEvent {}

