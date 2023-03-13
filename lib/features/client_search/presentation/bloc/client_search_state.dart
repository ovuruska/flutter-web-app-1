import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/features/client_search/domain/entities/client_search_entity.dart';

class ClientSearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Initial extends ClientSearchState {}

class Loading extends ClientSearchState {}

class Loaded extends ClientSearchState {
  final List<ClientSearchEntity> clients;
  final String query;

  Loaded({required this.query, required this.clients});

  @override
  List<Object?> get props => [clients, query];
}
