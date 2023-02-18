import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:scrubbers_employee_application/models/branch_wh.dart';
import 'package:scrubbers_employee_application/models/employee_wh.dart';
import '../../utils.dart';

class WorkingHoursBranchRepository {
  static final instance = WorkingHoursBranchRepository._();

  WorkingHoursBranchRepository._();

  static DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<List<BranchWorkingHour>?> getWorkingHours(
      int branchId, DateTime start, DateTime end) async {
    var queryParams = {
      'start': formatter.format(start),
      'end': formatter.format(end),
    };
    var uri = getUri(
      "/api/scheduling/hours/branch/${branchId.toString()}",
      queryParams: queryParams,
    );

    var request = http.Request('GET', uri);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var jsonObject = jsonDecode(respString);
      return jsonObject.map<BranchWorkingHour>((obj) => BranchWorkingHour.fromJson(obj)).toList();
    } else {
      return null;
    }
  }



  Future<void> setWorkingHour(int branchId, DateTime date,DateTime start,DateTime end) async {
    var headers = {'Content-Type': 'application/json'};
    var uri = getUri("/api/scheduling/hours/branch/${branchId.toString()}");
    var request = http.Request('POST', uri);
    var body = {
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
