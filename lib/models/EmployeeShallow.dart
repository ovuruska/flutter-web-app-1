import 'package:scrubbers_employee_application/common/WeeklySchedule.dart';

import 'Branch.dart';

class EmployeeShallow {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String role;
  final int branch;
  final String uid;
  late WeeklyScheduleDataStructure weeklyProgram;

  EmployeeShallow(
      {required this.id,
        required this.name,
        required this.phone,
        required this.email,
        required this.role,
        required this.branch,
        required this.uid,
        Map<DateTime, int>? values}) {
    this.weeklyProgram = WeeklyScheduleDataStructure(values ?? {});
  }

  static EmployeeShallow empty(){
    return EmployeeShallow(id: '', name: '', phone: '', email: '', role: '', branch: -1, uid: '',);
  }

  factory EmployeeShallow.fromJson(Map<String, dynamic> json) {

    return EmployeeShallow(
      id: json['id'].toString(),
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      role: json['role'],
      branch: json['branch'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': int.parse(id),
    'name': name,
    'phone': phone,
    'email': email,
    'role': role,
    'branch':branch,
    'uid': uid,
  };
}
