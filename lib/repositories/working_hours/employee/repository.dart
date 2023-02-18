import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:scrubbers_employee_application/models/employee_wh.dart';
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
    var uri = getUri(
      "/api/scheduling/hours/employee/${employeeId.toString()}",
      queryParams: queryParams,
    );

    var request = http.Request('GET', uri);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var jsonObject = jsonDecode(respString);
      return EmployeeWorkingHours.fromJson(jsonObject);
    } else {
      return null;
    }
  }

  Future<void> clearWorkingHour(int employeeId,DateTime date) async{
    var headers = {'Content-Type': 'application/json'};
    var uri = getUri("/api/scheduling/hours/employee/${employeeId.toString()}");
    var request = http.Request('POST', uri);
    var body = {
      'branch': null,
      "date": formatter.format(date),

    };

    request.body = json.encode(body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return;
    } else {
      return;
    }
  }

  Future<void> setWorkingHour(int employeeId, int? branchId, DateTime date,DateTime start,DateTime end) async {
    var headers = {'Content-Type': 'application/json'};
    var uri = getUri("/api/scheduling/hours/employee/${employeeId.toString()}");
    var request = http.Request('POST', uri);
    var body = {
      'branch': branchId,
      "start":start.toString(),
      "end":end.toString(),
      'date': formatter.format(date),
    };

    request.body = json.encode(body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return;
    } else {
      return;
    }
  }
}
