

import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/client_entity.dart';

class ClientAutocompleteEvent extends Equatable {
  const ClientAutocompleteEvent();

  @override
  List<Object> get props => [];
}

class ClientAutocompleteEventChanged extends ClientAutocompleteEvent {
  final String query;

  const ClientAutocompleteEventChanged({required this.query});

  @override
  List<Object> get props => [query];
}

class ClientAutocompleteEventSelected extends ClientAutocompleteEvent {
  final ClientEntity client;

  const ClientAutocompleteEventSelected({required this.client});

  @override
  List<Object> get props => [client];
}

class ClientAutocompleteEventCleared extends ClientAutocompleteEvent {}