import 'dart:convert' show jsonDecode;

import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:scrubbers_employee_application/models/Pet.dart';
import 'package:scrubbers_employee_application/repositories/utils.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

class DashboardRepository {
  static final instance = DashboardRepository._();

  DashboardRepository._();

  Future<Appointment?> getAppointment(int id) async {
    var response = await SchedulingAuthService.instance.request(
        "/api/schedule/appointment/${id.toString()}",);
    var respJson = await response.stream.bytesToString();
    var resp = jsonDecode(respJson);
    return Appointment.fromJson(resp);
  }

  Future<List<Appointment>?> getCancelledAppointments() async {
    var dateNow = DateTime.now();

    var queryParams = {
      "status": "Cancelled",
      "start__lt": DateFormat("yyyy-MM-dd").format(dateNow.subtract(Duration(days: 1))),
    };
    var response = await SchedulingAuthService.instance.request(
        "/api/schedule/appointments",
        queryParams: queryParams);


    var result = await listOfAppointments(response);
    return result;
  }

  Future<List<Appointment>?> getPriorAppointments(PetModel pet) async {
    var dateNow = DateTime.now();

    var queryParams = {
      "start__lt": DateFormat("yyyy-MM-dd").format(dateNow.subtract(Duration(days: 1))),
      "dog": pet.id.toString(),
      "status":"Completed"
    };

    var response = await SchedulingAuthService.instance.request(
        "/api/schedule/appointments",
        queryParams: queryParams);

    var result = await listOfAppointments(response);
    return result;
  }



  Future<List<Appointment>?> getUpcomingAppointments(PetModel pet) async {
    var dateNow = DateTime.now();

    var queryParams = {
      "start__gt": DateFormat("yyyy-MM-dd").format(dateNow.add(Duration(days: 1))),
      "dog": pet.id.toString(),
    };

    var response = await SchedulingAuthService.instance.request(
        "/api/schedule/appointments",
        queryParams: queryParams);

    var result = await listOfAppointments(response);
    return result;
  }


  Future<List<Appointment>?> getReschedulingAppointments() async {
    var dateNow = DateTime.now();

    var queryParams = {
      "status": "Rescheduling",
      "start__gt": DateFormat("yyyy-MM-dd").format(dateNow),
      "start__lt":
          DateFormat("yyyy-MM-dd").format(dateNow.add(Duration(days: 14)))
    };

    var response = await SchedulingAuthService.instance.request(
        "/api/schedule/appointments",
        queryParams: queryParams);

    var result = await listOfAppointments(response);
    return result;
  }

  Future<List<Appointment>?> getWeeklyAppointments(
      Employee employee, DateTime start) async {
    var queryParams = {
      "start__gt": DateFormat("yyyy-MM-dd").format(start),
      "start__lt":
          DateFormat("yyyy-MM-dd").format(start.add(Duration(days: 7))),
      "employee": employee.id,
    };

    var response = await SchedulingAuthService.instance.request(
        "/api/schedule/appointments",
        queryParams: queryParams);
    var result = await listOfAppointments(response);
    return result;
  }

  Future<List<Appointment>?> getPendingAppointments() async {
    var dateNow = DateTime.now();
    var queryParams = {
      "status": "Pending",
      "start__gt": DateFormat("yyyy-MM-dd").format(dateNow),
      "start__lt":
          DateFormat("yyyy-MM-dd").format(dateNow.add(Duration(days: 14))),
    };

    var response = await SchedulingAuthService.instance.request(
        "/api/schedule/appointments",
        queryParams: queryParams);

    var result = await listOfAppointments(response);
    return result;
  }

  Future<List<Appointment>?> getDailyAppointments(
      Branch branch, DateTime dateTime) async {
    const format = "yyyy-MM-dd";
    String startGreaterThan = DateFormat(format).format(dateTime);
    String endLessThan =
        DateFormat(format).format(dateTime.add(Duration(days: 1)));

    var queryParams = {
      "branch": branch.id.toString(),
      "start__gt": startGreaterThan,
      "start__lt": endLessThan,
    };

    var response = await SchedulingAuthService.instance.request(
        "/api/schedule/appointments",
        queryParams: queryParams);

    var result = await listOfAppointments(response);
    return result;
  }
}
