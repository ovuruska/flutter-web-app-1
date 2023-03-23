import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import 'utils.dart';

class EmployeeRepository {
  static final EmployeeRepository instance = EmployeeRepository._();

  EmployeeRepository._();

  Future<List<Employee>?> fetchAll() async {


    var response = await SchedulingAuthService.instance.request("/api/employees");

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      var jsonObject = jsonDecode(responseString);
      var employees =
          jsonObject.map<Employee>((e) => Employee.fromJson(e)).toList();
      return employees;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<List<Employee>?> getEmployeesByBranch(String branchId) async {
    var response = await SchedulingAuthService.instance.request("/api/employees?branch=$branchId");

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      var data = json.decode(responseString) as List;
      return data.map((e) => Employee.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<Employee> init() async {
    var uri = getUri("/api/employee");
    var request = http.Request('POST', uri);

    http.StreamedResponse response = await request.send();

    var respString = await response.stream.bytesToString();
    return Employee.fromJson(jsonDecode(respString));
  }

  Future<bool> removeEmployee(String employeeId) async {
    var uri = getUri("/api/employee/$employeeId");
    var request = http.Request('DELETE', uri);

    http.StreamedResponse response = await request.send();
    return response.statusCode == 204;
  }

  Future<Employee?> modify(Employee employee) async {
    var headers = {
      'Content-Type': 'application/json'
    };

    var uri = getUri("/api/employee/${employee.id}");
    var request = http.Request('PATCH', uri);
    var currentBranch = employee.branch;
    request.body = json.encode({
      "name": employee.name ,
      "phone": employee.phone ,
      "email": employee.email ,
      "branch": (currentBranch.id == -1 )? null : currentBranch.id,
      "role":employee.role
    });
    var reason = jsonDecode(request.body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      return Employee.fromJson(jsonDecode(respString));
    }
    else {
      print(await response.headers);
      print(await response.stream.bytesToString());
      print(response.reasonPhrase);
      return null;
    }



  }
}
