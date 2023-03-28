// Create a class named AwaitingAppointmentsService
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/repositories/utils.dart';
import 'package:scrubbers_employee_application/services/auth.dart';


class AwaitingAppointmentsService {
  static final AwaitingAppointmentsService instance =
      AwaitingAppointmentsService._internal();

  AwaitingAppointmentsService._internal();

  Future<List<AppointmentEntity>?> fetchAll() async {
    var dateNow = DateTime.now();

    var queryParams = {
      "status": "Pending",
      "start__gt": DateFormat("yyyy-MM-dd").format(dateNow),
      "start__lt":
          DateFormat("yyyy-MM-dd").format(dateNow.add(Duration(days: 14)))
    };
    var response = await SchedulingAuthService.instance.request( "/api/schedule/appointments",method:"GET", queryParams: queryParams);
    var result = await listOfAppointments(response);
    return result;
  }
}
