

import 'package:equatable/equatable.dart';

class ClientSearchEvent extends Equatable {


  const ClientSearchEvent();

  @override
  List<Object> get props => [];
}

class ClientSearchQueryChanged extends ClientSearchEvent {
  final String query;

  const ClientSearchQueryChanged({required this.query});

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'ClientSearchQueryChanged { query: $query }';
}

class ClientSearchQueryCleared extends ClientSearchEvent {}