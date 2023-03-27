import 'package:equatable/equatable.dart';

class ClientPetItem extends Equatable {
  final int id;
  final String name;
  final String breed;

  ClientPetItem({required this.id, required this.name, required this.breed});

  @override
  List<Object?> get props => [name, breed];

  factory ClientPetItem.fromJson(Map<String, dynamic> json) {
    return ClientPetItem(
      id: json['id'],
      name: json['name'],
      breed: json['breed'],
    );
  }

}
