import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import 'utils.dart';

class AppointmentRepository {
  static final instance = AppointmentRepository._();

  AppointmentRepository._();

  Future<AppointmentEntity?> patchAppointment(AppointmentEntity newAppointment) async {
    var route = "/api/schedule/appointment/${newAppointment.id}";
    var body = newAppointment.shallowJson();
    
    SchedulingAuthService authService = SchedulingAuthService.instance;
    var response = await authService.jsonRequest(
      route,
      method: "PATCH",
      body: body,
    );
    var respString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return AppointmentEntity.fromJson(jsonDecode(respString));
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<List<AppointmentEntity>?> getAppointmentsAfter(DateTime dateTime) async {
    String startGreaterThan = DateFormat('dd-MM-yyyy').format(dateTime);

    var queryParams = {"start__gt": startGreaterThan};
    var uri = getUri("/api/schedule/appointments", queryParams: queryParams);
    var request = http.Request('GET', uri);

    http.StreamedResponse response = await request.send();

    var result = await listOfAppointments(response);
    return result;
  }
}
