
import 'dart:convert';

import 'package:scrubbers_employee_application/constants.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:http/http.dart' as http;

var getUri = (String path,{Map<String,dynamic> ?queryParams  = null}) => Uri.http(backendUrl, path,queryParams);

Future<List<Appointment>?> listOfAppointments(
    http.StreamedResponse response) async {
  if (response.statusCode == 200) {
    var respString = await response.stream.bytesToString();
    var data = jsonDecode(respString) as List;
    var appointments = data.map((e) => Appointment.fromJson(e)).toList();
    appointments.sort((a, b) => a.start.compareTo(b.start));
    return appointments;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}
