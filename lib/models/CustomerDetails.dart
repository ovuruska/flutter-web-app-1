import 'package:scrubbers_employee_application/models/Customer.dart';
import 'package:scrubbers_employee_application/models/Pet.dart';

import 'PetShallow.dart';

class CustomerDetails extends Customer {
  final double lifetimeTips;
  final double lifetimeProductSales;
  final double lifetimeServiceSales;
  final List<PetModelShallow> dogs;

  CustomerDetails(
      {required String id,
      required this.lifetimeTips,
      required this.lifetimeProductSales,
      required this.lifetimeServiceSales,
      required this.dogs,
      required String name,
      required String phone,
      required String email,
      required String uid})
      : super(id: id, name: name, phone: phone, email: email, uid: uid);

  @override
  Map<String, dynamic> toJson() {
    return super.toJson()
      ..addAll({
        'lifetime_tips': lifetimeTips,
        'lifetime_product_sales': lifetimeProductSales,
        'lifetime_service_sales': lifetimeServiceSales,
        'dogs': dogs.map((e) => e.toJson()).toList(),
      });
  }

  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
        id: json['id'].toString(),
        name: json['name'].toString(),
        phone: json['phone'].toString(),
        email: json['email'].toString(),
        uid: json['uid'].toString(),
        lifetimeTips: json['lifetime_tips'] as double,
        lifetimeProductSales: json['lifetime_product_sales'] as double,
        lifetimeServiceSales: json['lifetime_service_sales'] as double,
        dogs: json['dogs']
            .map<PetModelShallow>((e) => PetModelShallow.fromJson(e))
            .toList());
  }
}
