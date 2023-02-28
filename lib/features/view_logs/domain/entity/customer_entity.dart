import 'package:scrubbers_employee_application/features/view_logs/domain/entity/target_entity.dart';

class CustomerEntity extends TargetEntity {
  CustomerEntity({required int id, required String name}) : super(id: id, name: name);

  CustomerEntity.fromJson(Map<String, dynamic> json) : super(id: json['id'], name: json['name']);

}