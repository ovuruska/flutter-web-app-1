import 'package:scrubbers_employee_application/common/BaseModel.dart';

class Branch  extends BaseModel{
  final String name;
  final String address;
  final String phone;
  final String description;
  final String email;
  final int id;

  Branch({
        required this.id,
      required this.name,
      required this.address,
      required this.phone,
      this.description = "",
      this.email = ""}):super(id);

  toString() {
    return "$name";
  }



  Branch.empty()
      : this(id: -1, name: "", address: "", phone: "", description: "");

  Branch.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'].toString(),
        name = json['name'],
        address = json['address'],
        phone = json['phone'],
        description = json['description'],
        super(json['id']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'phone': phone,
        'description': description,
      };
}
