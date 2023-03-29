

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {

  final int id;
  final String name;
  final double cost;
  final String description;
  final String category;

  ProductEntity({
    required this.id,
    required this.name,
    required this.cost,
    required this.description,
    required this.category,
  });

  @override
  List<Object?> get props => [id, name, cost, description, category];

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    var cost = json['cost'];
    if(cost is String){
      cost = double.parse(cost);
    }
    return ProductEntity(
      id: json['id'],
      name: json['name'],
      cost: cost,
      description: json['description'] ?? "",
      category: json['category'] ?? "",
    );
  }

  String toString() => name;

  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'cost': cost,
      'description': description,
      'category': category,
    };
  }

}