import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PetInformation extends Equatable {
  final int id;
  final String name;
  final String breed;
  final String coatType;
  final String weight;
  final String specialHandling;

  const PetInformation({
    required this.id,
    required this.name,
    required this.breed,
    required this.coatType,
    required this.weight,
    required this.specialHandling,
  });

  @override
  List<Object?> get props => [name];
}
