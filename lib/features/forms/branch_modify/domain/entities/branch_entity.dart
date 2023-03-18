import 'package:equatable/equatable.dart';

import '../../../../../models/Branch.dart';


class BranchEntity extends Equatable {
  int id;
  String name;
  String address;
  String phone;
  String email;

  BranchEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
  });

  BranchEntity clone() {
    return BranchEntity(
      id: id,
      name: name,
      address: address,
      phone: phone,
      email: email,
    );
  }

  @override
  List<Object?> get props => [id];

  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
    };
  }

  factory BranchEntity.fromJson(Map<String, dynamic> json) {
    return BranchEntity(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Branch toBranch() {
    return Branch(
      id: id,
      name: name,
      address: address,
      phone: phone,
      email: email,
    );
  }

  factory BranchEntity.fromBranch(Branch branch) {
    return BranchEntity(
      id: branch.id,
      name: branch.name,
      address: branch.address,
      phone: branch.phone,
      email: branch.email,
    );
  }

  
}