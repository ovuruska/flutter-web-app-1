import 'package:equatable/equatable.dart';

class PetEntity extends Equatable {
  int id;
  final String name;
  final String breed;
  final DateTime? birth;
  final double weight;
  final String pet = "Dog";
  final DateTime rabbiesVaccination;
  final bool specialHandling;
  final String? specialHandlingNotes;
  final String? customerNotes;
  final String coatType;

  PetEntity({
    required this.id,
    required this.name,
    required this.breed,
    required this.birth,
    required this.weight,
    required this.rabbiesVaccination,
    required this.specialHandling,
    required this.specialHandlingNotes,
    required this.customerNotes,
    required this.coatType,
  });

  @override
  List<Object> get props => [
        name,
        breed,
        birth ?? "",
        weight,
        rabbiesVaccination,
        specialHandling,
        specialHandlingNotes ?? "",
        customerNotes ?? "",
        coatType,
      ];

  factory PetEntity.fromJson(Map<String, dynamic> json) => PetEntity(
        id: json["id"],
        name: json["name"],
        breed: json["breed"],
        birth: json["birth"] == null ? null : DateTime.parse(json["birth"]),
        weight: json["weight"] ?? 0,
        rabbiesVaccination: DateTime.parse(json["rabies_vaccination"]),
        specialHandling: json["special_handling"] ?? false,
        specialHandlingNotes: json["employee_notes"] ?? "",
        customerNotes: json["customer_notes"] ?? "",
        coatType: json["coat_type"],
      );

  @override
  String toString() => name;

  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "name": name,
      "breed": breed,
      "birth": birth?.toUtc().toIso8601String(),
      "weight": weight,
      "rabies_vaccination": rabbiesVaccination.toUtc().toIso8601String(),
      "special_handling": specialHandling,
      "employee_notes": specialHandlingNotes,
      "customer_notes": customerNotes,
      "coat_type": coatType,
    };
  }

}
