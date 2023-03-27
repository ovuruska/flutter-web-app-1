import 'package:scrubbers_employee_application/common/WeeklySchedule.dart';


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

  static String getRole(int role){


    switch(role){
      case 10:
        return 'We Wash';
      case 15:
        return 'Full Grooming';
      case 20:
        return 'Accountant';
      case 30:
        return 'Manager';
      case 40:
        return 'Admin';
      default:
        return 'We Wash';
    }
  }

  static int getRoleValue(String role){
    switch(role){
      case 'We Wash':
        return 10;
      case 'Full Grooming':
        return 15;
      case 'Accountant':
        return 20;
      case 'Manager':
        return 30;
      case 'Admin':
        return 40;
      default:
        return 10;
    }
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
      role: getRole(json['role'] as int),
      branch: json['branch'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': int.parse(id),
    'name': name,
    'phone': phone,
    'email': email,
    'role': getRoleValue(role),
    'branch':branch,
    'uid': uid,
  };
}
