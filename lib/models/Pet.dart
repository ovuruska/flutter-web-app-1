import 'package:scrubbers_employee_application/common/DataTypes.dart';

import 'Customer.dart';


enum CoatType {
  SMOOTH_SHORT,
  SMOOTH_LONG,
  DOUBLE_COATED,
  DOODLES

}


class PetModel {
  final int id;
  final String name;
  final String breed;
  final int age;
  final double weight;
  final Customer owner;
  bool specialHandling;
  final String customerNotes;
  String employeeNotes;
  late DateTime rabiesVaccination = DateTime.now();
  final CoatType coatType;

  PetModel({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.weight,
    required this.owner,
    this.specialHandling = false,
    this.employeeNotes = "",
    this.customerNotes = "",
    DateTime? rabiesVaccination,
    this.coatType = CoatType.DOODLES,
  }) : rabiesVaccination = rabiesVaccination ?? DateTime.now();

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
        id: json['id'],
        owner: Customer.fromJson(json['owner']),
        name: json['name'].toString(),
        breed: json['breed'].toString(),
        age: json['age'] ?? 0,
        specialHandling: json.containsKey("special_handling")
            ? json["special_handling"]
            : false,
        employeeNotes: json.containsKey("employee_notes")
            ? json['employee_notes'].toString()
            : "",
        customerNotes: json.containsKey("customer_notes")
            ? json['customer_notes'].toString()
            : "",
        rabiesVaccination: json.containsKey("rabies_vaccination") && json['rabies_vaccination'] != null
            ? DateTime.parse(json['rabies_vaccination']).toLocal()
            : DateTime.now(),
        coatType: json.containsKey("coat_type")
            ? DataTypes.stringToCoatType(json['coat_type'])
            : CoatType.DOODLES,
        weight: json['weight'] ?? 0.0);
  }

  toJson() =>
      {
        'id': id,
        'coat_type': DataTypes.coatTypeToString(coatType),
        'name': name,
        'owner': owner.toJson(),
        'breed': breed,
        'age': age,
        'weight': weight,
        'special_handling': specialHandling,
        'customer_notes': customerNotes,
        'employee_notes': employeeNotes,
        'rabies_vaccination': rabiesVaccination.toIso8601String(),
      };
}
