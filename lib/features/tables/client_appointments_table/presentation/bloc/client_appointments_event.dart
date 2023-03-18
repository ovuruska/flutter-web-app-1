import 'package:equatable/equatable.dart';

import '../../../../sidebars/client_search/domain/entities/client_search_entity.dart';



class ClientAppointmentsEvent extends Equatable {
  @override
  List<Object?> get props => [];

}

class SetClientEvent extends ClientAppointmentsEvent {
  final ClientSearchEntity client;

  SetClientEvent({required this.client});
}

class GetClientAppointmentsEvent extends ClientAppointmentsEvent {
  final int client;

  GetClientAppointmentsEvent({required this.client});
}