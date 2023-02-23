class Product {
  final String id;
  final String name;
  final String description;
  final double cost;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.cost});

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'],
        description = json['description'],
        cost = double.parse(json['cost']);

  toString() => name;
  toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'cost': cost,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
