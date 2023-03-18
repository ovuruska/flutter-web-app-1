

import 'package:equatable/equatable.dart';

class ClientInformation extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;

  ClientInformation({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [id, name, email, phoneNumber];

  factory ClientInformation.fromJson(Map<String, dynamic> json) {
    return ClientInformation(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone'],
    );
  }


}