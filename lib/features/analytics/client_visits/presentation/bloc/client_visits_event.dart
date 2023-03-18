

import 'package:equatable/equatable.dart';

class ClientVisitsEvent extends Equatable {
  const ClientVisitsEvent();

  @override
  List<Object> get props => [];
}

class GetClientVisitsEvent extends ClientVisitsEvent {

  final int id;

  const GetClientVisitsEvent({required this.id});

  @override
  List<Object> get props => [id];
}