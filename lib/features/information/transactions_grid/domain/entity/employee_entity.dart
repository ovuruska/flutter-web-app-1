

import 'target_entity.dart';

class EmployeeEntity extends TargetEntity {

  EmployeeEntity({required int id, required String name}) : super(id: id, name: name);

  EmployeeEntity.fromJson(Map<String, dynamic> json) : super(id: json['id'], name: json['name']);
}