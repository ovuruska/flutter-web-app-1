import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class BranchNameAndId extends Equatable {
  final int id;
  final String name;

  BranchNameAndId({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  factory BranchNameAndId.fromJson(Map<String, dynamic> json) {
    return BranchNameAndId(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class DailySlotEntity extends Equatable {
  final DateTime date;
  final BranchNameAndId branch;
  final double morningCapacity;
  final double afternoonCapacity;

  DailySlotEntity({
    required this.date,
    required branchName,
    required branchId,
    required this.morningCapacity,
    required this.afternoonCapacity,
  }) : branch = BranchNameAndId(name: branchName, id: branchId);

  @override
  List<Object?> get props => [date, branch, morningCapacity, afternoonCapacity];

  factory DailySlotEntity.fromJson(Map<String, dynamic> json) {
    return DailySlotEntity(
      date: DateTime.parse(json['date']),
      branchName: json['branch']['name'],
      branchId: json['branch']['id'],
      morningCapacity: json['morning_capacity'],
      afternoonCapacity: json['afternoon_capacity'],
    );
  }

  Map<String, dynamic> toJson() {
    // 2023-02-03
    var formatter = DateFormat('yyyy-MM-dd');
    return {
      'date': formatter.format(date),
      'branch': branch.toJson(),
      'morning_capacity': morningCapacity,
      'afternoon_capacity': afternoonCapacity,
    };
  }
}
