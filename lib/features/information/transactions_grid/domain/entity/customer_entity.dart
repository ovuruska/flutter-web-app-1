
import 'target_entity.dart';

class CustomerEntity extends TargetEntity {
  CustomerEntity({required int id, required String name}) : super(id: id, name: name);

  CustomerEntity.fromJson(Map<String, dynamic> json) : super(id: json['id'], name: json['name']);

}