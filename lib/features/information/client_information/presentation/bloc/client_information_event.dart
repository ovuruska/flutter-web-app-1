

import 'package:equatable/equatable.dart';

class ClientInformationEvent extends Equatable {
  const ClientInformationEvent();

  @override
  List<Object> get props => [];
}

class GetClientInformationEvent extends ClientInformationEvent {
  final int id;

  GetClientInformationEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class PurgeClientInformationEvent extends ClientInformationEvent {}

