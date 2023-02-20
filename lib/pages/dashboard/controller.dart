import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:scrubbers_employee_application/pages/dashboard/model.dart';
import 'package:scrubbers_employee_application/pages/dashboard/repository.dart';

class DashboardBloc extends Bloc<DashboardModel> {
  DashboardBloc() {
    subject.sink.add(DashboardModel());
  }

  setAppointments(List<Appointment> appointments){
    subject.sink.add(subject.value.setAppointments(appointments));
  }

  removeAppointment(Appointment appointment){
    subject.sink.add(subject.value.setAppointments(subject.value.appointments.where((a) => a.id != appointment.id).toList()));
  }

  List<Appointment> filterAppointments(List<Appointment> appointments){
    return appointments.where((a) => a.status != AppointmentStatus.RESCHEDULING && a.status != AppointmentStatus.CANCELLED).toList();
  }

  fetchDailyAppointments(Branch branch,DateTime dateTime) async {
    var appointments = await DashboardRepository.instance.getDailyAppointments(branch,dateTime);
    if(appointments == null) return null;
    else{
      this.setAppointments(filterAppointments(appointments));
      return appointments;
    }
  }

  fetchWeeklyAppointments(Employee employee,DateTime start) async {
    var appointments = await DashboardRepository.instance.getWeeklyAppointments(employee,start);

    if(appointments == null) return null;
    else{
      this.setAppointments(filterAppointments(appointments));
      return appointments;
    }
  }


  patchAppointmentLocal(Appointment appointment) async {
    subject.sink.add(subject.value.patchAppointment(appointment));

  }

  patchAppointment(Appointment appointment){
    subject.sink.add(subject.value.patchAppointment(appointment));
  }

  setService(String service) {
    subject.sink.add(subject.value.setService(service));
  }

  setEmployees(List<Employee> employees) {
    subject.sink.add(subject.value.setEmployees(employees));
  }

  setShowCompleted(bool showCompleted) {
    subject.sink.add(subject.value.setShowCompleted(showCompleted));
  }

  setShowCancelled(bool showCancelled) {
    subject.sink.add(subject.value.setShowCancelled(showCancelled));
  }

  setShowConfirmed(bool showConfirmed) {
    subject.sink.add(subject.value.setShowConfirmed(showConfirmed));
  }

  setShowPending(bool showPending) {
    subject.sink.add(subject.value.setShowPending(showPending));
  }
  setScrollUpdated(){
    subject.value.setScrollUpdated();
  }
  clearScrollUpdated(){
    subject.sink.add(subject.value.clearScrollUpdated());
  }
}

final dashboardBloc = DashboardBloc();