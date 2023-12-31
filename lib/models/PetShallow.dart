import 'package:scrubbers_employee_application/common/DataTypes.dart';

import 'Pet.dart';




class PetModelShallow {
  final int id;
  final String name;
  final String breed;
  final int age;
  final double weight;
  final int owner;
  final bool specialHandling;
  final String customerNotes;
  final String employeeNotes;
  late DateTime rabiesVaccination = DateTime.now();
  final CoatType coatType;

  PetModelShallow({
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

  factory PetModelShallow.fromJson(Map<String, dynamic> json) {
    return PetModelShallow(
        id: json['id'],
        owner: json["owner"],
        name: json['name'].toString(),
        breed: json['breed'].toString(),
        age: json['age'],
        specialHandling: json.containsKey("special_handling")
            ? json["special_handling"]
            : false,
        employeeNotes: json.containsKey("employee_notes")
            ? json['employee_notes'].toString()
            : "",
        customerNotes: json.containsKey("customer_notes")
            ? json['customer_notes'].toString()
            : "",
        rabiesVaccination: json.containsKey("rabies_vaccination")
            ? DateTime.parse(json['rabies_vaccination']).toLocal()
            : DateTime.now(),
        coatType: json.containsKey("coat_type")
            ? DataTypes.stringToCoatType(json['coat_type'])
            : CoatType.DOODLES,
        weight: json['weight']);
  }

  toJson() =>
      {
        'id': id,
        'coat_type': DataTypes.coatTypeToString(coatType),
        'name': name,
        'owner': owner,
        'breed': breed,
        'age': age,
        'weight': weight,
        'special_handling': specialHandling,
        'customer_notes': customerNotes,
        'employee_notes': employeeNotes,
        'rabies_vaccination': rabiesVaccination.toIso8601String(),
      };
}
