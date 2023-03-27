

import '../constants/roles.dart';

class EmployeeEntity {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String role;

  EmployeeEntity({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    required this.role,
  });

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) {
    if(json['role'] is String){
      return EmployeeEntity(
        id: json['id'],
        name: json['name'],
        email: json['email'] ?? "",
        phone: json['phone'] ?? "",
        role: json['role'],
      );
    }else{
      return EmployeeEntity(
        id: json['id'],
        name: json['name'],
        email: json['email'] ?? "",
        phone: json['phone'] ?? "",
        role: getRole(json['role']),
      );
    }


  }

  @override
  String toString() => name;

  Map<String,dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'role': convertRole(role),
  };

  EmployeeEntity copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? role,
  }) {
    return EmployeeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
    );
  }

}
