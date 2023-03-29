import 'Appointment.dart';
import 'Employee.dart';

class NotificationModel {
  Employee sender;
  AppointmentEntity appointment;
  String body;
  String title;

  NotificationModel(
      {required this.sender,
      required this.appointment,
      this.body = "",
      this.title = ""});
}
