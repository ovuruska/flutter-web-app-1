

import 'package:equatable/equatable.dart';

import 'client_entity.dart';
import 'pet_entity.dart';

class ClientDetails extends ClientEntity {
  final double lifetimeTips;
  final double lifetimeProductSales;
  final double lifetimeServiceSales;
  final List<PetEntity> pets;

  ClientDetails(
      {required int id,
        required this.lifetimeTips,
        required this.lifetimeProductSales,
        required this.lifetimeServiceSales,
        required this.pets,
        required String name,
        required String phone,
        required String email,
        required String address
       })
      : super(id: id, name: name, phone: phone, email: email,address:address);

  @override
  Map<String, dynamic> toJson() {
    return super.toJson()
      ..addAll({
        'lifetime_tips': lifetimeTips,
        'lifetime_product_sales': lifetimeProductSales,
        'lifetime_service_sales': lifetimeServiceSales,
        'pets': pets.map((e) => e.toJson()).toList(),
      });
  }

  factory ClientDetails.fromJson(Map<String, dynamic> json) {
    return ClientDetails(
        id: json['id'],
        name: json['name'].toString(),
        phone: json['phone'] ?? "",
        email: json['email'] ?? "",
        lifetimeTips: json['lifetime_tips'] as double,
        lifetimeProductSales: json['lifetime_product_sales'] as double,
        lifetimeServiceSales: json['lifetime_service_sales'] as double,
        pets: json['dogs']
            .map<PetEntity>((e) => PetEntity.fromJson(e))
            .toList(), address: json['address'] ?? "");
  }
}
