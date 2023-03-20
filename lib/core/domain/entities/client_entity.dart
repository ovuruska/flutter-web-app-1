

import 'package:equatable/equatable.dart';

class ClientEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;

  ClientEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  @override
  List<Object?> get props => [id, name, email, phone, address];


  factory ClientEntity.fromJson(Map<String, dynamic> json) {
    return ClientEntity(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  @override
  String toString(){
    return name;
  }
}