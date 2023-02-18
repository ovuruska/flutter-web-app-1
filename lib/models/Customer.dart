
class Customer{
  final String id;
  final String name;
  final String phone;
  final String email;
  final String? address;
  final String uid;


  Customer({required this.id,required this.name,required this.phone,required this.email, this.address = "",required this.uid});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'].toString(),
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      email: json['email'].toString(),
      address: json.containsKey('address') ? json['address'] : "",
      uid: json['uid'].toString(),

    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'email': email,
    'address': address,
    'uid': uid,
  };
}