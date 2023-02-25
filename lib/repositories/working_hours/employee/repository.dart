import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:scrubbers_employee_application/models/employee_wh.dart';
import 'package:scrubbers_employee_application/services/auth.dart';
import '../../utils.dart';

class WorkingHoursEmployeeRepository {
  static final instance = WorkingHoursEmployeeRepository._();

  WorkingHoursEmployeeRepository._();

  static DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<EmployeeWorkingHours?> getWorkingHours(
      int employeeId, DateTime start, DateTime end) async {
    var queryParams = {
      'start': formatter.format(start),
      'end': formatter.format(end),
    };

    var response = await SchedulingAuthService.instance.request(
      "/api/scheduling/hours/employee/${employeeId.toString()}",
      queryParams: queryParams,
    );


    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var jsonObject = jsonDecode(respString);
      return EmployeeWorkingHours.fromJson(jsonObject);
    } else {
      return null;
    }
  }

  Future<void> clearWorkingHour(int employeeId,DateTime date) async{
    var body = {
      'branch': null,
      "date": formatter.format(date),
    };

    var response = await SchedulingAuthService.instance.jsonRequest(
      "/api/scheduling/hours/employee/${employeeId.toString()}",
      method: "POST",
      body: body,
    );


    if (response.statusCode == 200) {
      return;
    } else {
      return;
    }
  }

  Future<void> setWorkingHour(int employeeId, int? branchId, DateTime date,DateTime start,DateTime end) async {


    var body = {
      'branch': branchId,
      "start":start.toString(),
      "end":end.toString(),
      'date': formatter.format(date),
    };

    var response = await SchedulingAuthService.instance.jsonRequest(
      "/api/scheduling/hours/employee/${employeeId.toString()}",
      method: "POST",
      body: body,
    );


    if (response.statusCode == 200) {
      return;
    } else {
      return;
    }
  }
}
