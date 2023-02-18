import 'package:scrubbers_employee_application/models/Appointment.dart';

import '../models/Pet.dart';

class DataTypes {
  static String convertToString(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.PENDING:
        return "Pending";
      case AppointmentStatus.CONFIRMED:
        return "Confirmed";
      case AppointmentStatus.COMPLETED:
        return "Completed";
      case AppointmentStatus.CANCELLED:
        return "Cancelled";
      case AppointmentStatus.RESCHEDULING:
        return "Rescheduling";
      case AppointmentStatus.CHECKED_IN:
        return "CheckedIn";
      case AppointmentStatus.NO_SHOW:
        return "NoShow";
      case AppointmentStatus.PICKUP_READY:
        return "PickUpReady";
      case AppointmentStatus.CLOSED_CHARGED:
        return "ClosedCharged";
      default:
        return "Unknown";
    }
  }

  static AppointmentStatus convertFromString(String status) {
    switch (status) {
      case "Pending":
        return AppointmentStatus.PENDING;
      case "Confirmed":
        return AppointmentStatus.CONFIRMED;
      case "Completed":
        return AppointmentStatus.COMPLETED;
      case "Cancelled":
        return AppointmentStatus.CANCELLED;
      case "Rescheduling":
        return AppointmentStatus.RESCHEDULING;
      case "CheckedIn":
        return AppointmentStatus.CHECKED_IN;
      case "NoShow":
        return AppointmentStatus.NO_SHOW;
      case "PickUpReady":
        return AppointmentStatus.PICKUP_READY;
      case "ClosedCharged":
        return AppointmentStatus.CLOSED_CHARGED;

      default:
        return AppointmentStatus.PENDING;
    }
  }

  static String coatTypeToString(CoatType coatType) {
    switch (coatType) {
      case CoatType.SMOOTH_SHORT:
        return "Smooth (Short)";
      case CoatType.SMOOTH_LONG:
        return "Smooth (Long)";
      case CoatType.DOUBLE_COATED:
        return "Double Coated";
      case CoatType.DOODLES:
        return "Doodles";
      default:
        return "Doodles";
    }
  }

  static CoatType stringToCoatType(String coatType) {
    switch (coatType) {
      case "Smooth (Short)":
        return CoatType.SMOOTH_SHORT;
      case "Smooth (Long)":
        return CoatType.SMOOTH_LONG;
      case "Double Coated":
        return CoatType.DOUBLE_COATED;
      case "Doodles":
        return CoatType.DOODLES;
      default:
        return CoatType.DOODLES;
    }
  }
}
