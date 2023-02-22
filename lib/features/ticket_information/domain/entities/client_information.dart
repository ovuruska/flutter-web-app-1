import 'package:equatable/equatable.dart';

class ClientInformation extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;

  ClientInformation({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}