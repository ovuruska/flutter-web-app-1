

import 'package:equatable/equatable.dart';

class BranchEntity extends Equatable {

  final String name;
  final String address;
  final String phone;
  final String email;

  const BranchEntity({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, address, phone, email];

  
}