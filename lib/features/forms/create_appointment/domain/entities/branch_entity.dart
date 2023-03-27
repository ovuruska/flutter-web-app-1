import 'package:equatable/equatable.dart';

import '../../../../../models/Branch.dart';

class BranchEntity extends Equatable{
  final int id;
  final String name;
  final String address;

  const BranchEntity({
    required this.id,
    required this.name,
    required this.address,
  });

  @override
  List<Object?> get props => [id];

  factory BranchEntity.fromJson(Map<String, dynamic> json) => BranchEntity(
    id: json['id'],
    name: json['name'],
    address: json['address'],
  );

  factory BranchEntity.fromBranch(Branch branch) => BranchEntity(
    id: branch.id,
    name: branch.name,
    address: branch.address,
  );

  @override
  String toString() {
    return this.name;
  }
}