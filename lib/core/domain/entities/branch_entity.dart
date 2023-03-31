import 'package:equatable/equatable.dart';

class BranchEntity extends Equatable {
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
  List<Object?> get props => [id, name, address, phone, email, description];

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

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "address": address,
      "phone": phone,
      "email": email,
      "description": description,
    };
  }

  BranchEntity copyWith({
    int? id,
    String? name,
    String? address,
    String? phone,
    String? email,
    String? description,
  }) =>
      BranchEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        description: description ?? this.description,
      );
}
