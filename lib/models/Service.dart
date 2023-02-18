import 'package:scrubbers_employee_application/common/durationUtils.dart';

class ServiceModel {
  final String name;
  final String description;
  final double cost;
  final Duration duration;
  final int? id;

  ServiceModel(
      {required this.name,
      required this.description,
      required this.cost,
      required this.duration,
      this.id});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {

    return ServiceModel(
      name: json['name'].toString(),
      description: json['description'],
      cost: double.parse(json['cost']),
      duration: deserialize(json['duration']),
      id: json.containsKey("id") ? json['id'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'cost': cost,
      'duration': serialize(duration),
      'id': id,
    };
  }
}
