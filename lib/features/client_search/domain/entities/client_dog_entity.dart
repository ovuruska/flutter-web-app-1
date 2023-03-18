

import 'package:equatable/equatable.dart';

class ClientDogEntity extends Equatable{
  final int id;
  final String name;
  final String breed;

  const ClientDogEntity({required this.id, required this.name, required this.breed});

  @override
  List<Object?> get props => [id, name, breed];

  factory ClientDogEntity.fromJson(Map<String, dynamic> json) {
    return ClientDogEntity(
      id: json['id'],
      name: json['name'],
      breed: json['breed'],
    );
  }

}