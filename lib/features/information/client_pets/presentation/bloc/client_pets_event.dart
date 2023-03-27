

import 'package:equatable/equatable.dart';

class ClientPetsEvent extends Equatable {
  const ClientPetsEvent();

  @override
  List<Object> get props => [];
}

class GetClientPetsEvent extends ClientPetsEvent {
  final int id;

  GetClientPetsEvent({required this.id});

  @override
  List<Object> get props => [id];
}