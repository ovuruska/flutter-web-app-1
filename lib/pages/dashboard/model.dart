import '../../models/Appointment.dart';
import '../../models/Branch.dart';
import '../../models/Employee.dart';

class DashboardModel {
  List<Employee> employees = [];
  String currentService = "Full Grooming";
  bool showConfirmed = true;
  bool showPending = true;
  bool showCancelled = false;
  bool showCompleted = true;
  bool showNoShow = true;
  bool showPickUpReady = true;

  bool showInSession = true;
  bool showNoShowUnpaid = true;

  setShowPickUpReady(bool showPickUpReady) {
    this.showPickUpReady = showPickUpReady;
    return this;
  }

  setShowInSession(bool showInSession) {
    this.showInSession = showInSession;
    return this;
  }
  setShowNoShowUnpaid(bool showNoShowUnpaid) {
    this.showNoShowUnpaid = showNoShowUnpaid;
    return this;
  }

  setShowNoShow(bool showNoShow) {
    this.showNoShow = showNoShow;
    return this;
  }

  bool scrollUpdated = false;
  List<Appointment> appointments = [];

  setAppointments(List<Appointment> appointments) {
    this.appointments = appointments;
    return this;
  }

  List<Appointment> filterAppointments() {
    return this.appointments.where((a) {
      if (a.status == AppointmentStatus.CONFIRMED && this.showConfirmed) {
        return true;
      } else if (a.status == AppointmentStatus.PENDING && this.showPending) {
        return true;
      } else if (a.status == AppointmentStatus.COMPLETED && this.showCompleted) {
        return true;
      } else if (a.status == AppointmentStatus.NO_SHOW && this.showNoShow) {
        return true;
      } else if (a.status == AppointmentStatus.CANCELLED && this.showCancelled) {
        return true;
      } else if (a.status == AppointmentStatus.CHECKED_IN && this.showInSession) {
        return true;
      } else if (a.status == AppointmentStatus.NO_SHOW_UNPAID && this.showNoShowUnpaid) {
        return true;
      }else if(a.status == AppointmentStatus.PICKUP_READY && this.showInSession){
        return true;
      }
      return false;
    }).toList();
  }

  patchAppointment(Appointment appointment) {
    bool found = false;
    this.appointments = this.appointments.map((a) {
      if (a.id == appointment.id) {
        found = true;
        return appointment;
      }
      return a;
    }).toList();
    if (!found) {
      this.appointments.add(appointment);
    }
    return this;
  }

  setScrollUpdated() {
    this.scrollUpdated = true;
    return this;
  }

  clearScrollUpdated() {
    this.scrollUpdated = false;
    return this;
  }

  setService(String service) {
    currentService = service;
    return this;
  }

  setEmployees(List<Employee> employees) {
    this.employees = employees;
    return this;
  }

  setShowConfirmed(bool showConfirmed) {
    this.showConfirmed = showConfirmed;
    return this;
  }

  setShowPending(bool showPending) {
    this.showPending = showPending;
    return this;
  }

  setShowCancelled(bool showCancelled) {
    this.showCancelled = showCancelled;
    return this;
  }

  setShowCompleted(bool showCompleted) {
    this.showCompleted = showCompleted;
    return this;
  }
}
