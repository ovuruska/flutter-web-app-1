

class TargetEntity {
  final int id;
  final String name;

  TargetEntity({
    required this.id, required this.name
  });

  factory TargetEntity.fromJson(Map<String, dynamic> json) {
    return TargetEntity(
      id: json['id'],
      name: json['name'],
    );
  }
}