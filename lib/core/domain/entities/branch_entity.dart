

import 'package:equatable/equatable.dart';

class BranchEntity extends Equatable{
  final int id;
  final String name;
  final String? address;
  final String? phone;
  final String? email;
  final String? description;

  const BranchEntity({
    required this.id,
    required this.name,
    this.address,
    this.phone,
    this.email,
    this.description,
  });

  @override
  List<Object?> get props => [id,name,address,phone,email,description];

@override
  String toString() => name;

  factory BranchEntity.fromJson(Map<String, dynamic> json) => BranchEntity(
    id: json["id"],
    name: json["name"],
    address: json["address"] ?? "",
    phone: json["phone"] ?? "",
    email: json["email"] ?? "",
    description: json["description"] ?? "",
  );
}