import 'package:equatable/equatable.dart';

import 'client_dog_entity.dart';

class ClientSearchEntity extends Equatable {
  final int id;
  final DateTime? lastAppointment;
  final String name;
  final List<ClientDogEntity> dogs;

  const ClientSearchEntity(
      {required this.id,
      required this.lastAppointment,
      required this.name,
      required this.dogs});

  @override
  List<Object?> get props => [id, lastAppointment, name, dogs];

  factory ClientSearchEntity.fromJson(Map<String, dynamic> json) {
    return ClientSearchEntity(
      id: json['id'],
      lastAppointment: json['last_appointment_date'] == null
          ? null
          : DateTime.parse(json['last_appointment_date']),
      name: json['name'],
      dogs: (json['dogs'] as List)
          .map((e) => ClientDogEntity.fromJson(e))
          .toList(),
    );
  }
}
