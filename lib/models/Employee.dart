import 'package:scrubbers_employee_application/common/WeeklySchedule.dart';

import 'Branch.dart';

const roles = {
  0: 'Anonymous',
  1: 'Customer',
  10: 'We Wash',
  15: 'Full Grooming',
  20:'Accountant',
  30: 'Manager',
};


class Employee {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String role;
  final Branch branch;
  final String uid;
  late WeeklyScheduleDataStructure weeklyProgram;

  Employee(
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

  static Employee empty(){
    return Employee(id: '', name: '', phone: '', email: '', role: '', branch: Branch.empty(), uid: '',);
  }

  factory Employee.fromJson(Map<String, dynamic> json) {
    if (json["branch"] == null) {
      json["branch"] = Branch.empty();
    }else{
      json["branch"] = Branch.fromJson(json["branch"]);
    }
    if(json["role"] is int){
      json["role"] = roles[json["role"]];
    }

    try{
      return Employee(
        id: json['id'].toString(),
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        role: json['role'],
        branch: json['branch'],
        uid: json['uid'],
      );
    }catch(err){
      return Employee.empty();
    }

  }

  Map<String, dynamic> toJson() => {
        'id': int.parse(id),
        'name': name,
        'phone': phone,
        'email': email,
        'role': role,
        'branch': (branch.id == '') ? null : branch.toJson(),
        'uid': uid,
      };
}
