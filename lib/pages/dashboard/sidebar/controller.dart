

import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';

import '../repository.dart';
import 'calendar/controller.dart';
import 'model.dart';

class SidebarBloc extends Bloc<SidebarModel> {

  SidebarBloc() {
    subject.add(SidebarModel());
  }

  setBranch(Branch branch) {
    subject.sink.add(subject.value.setBranch(branch));
  }

  Future<List<Appointment>?> fetchDailyAppointments(Branch branch,DateTime date) async {
    var branch = subject.value.currentBranch;
    var date = sidebarCalendarBloc.value.selectedDate;

    if(branch == null) return null;
    var appointments = await DashboardRepository.instance.getDailyAppointments(branch,date);
    if(appointments == null) return null;
    else{
      this.setCalendarAppointments(appointments);
      return appointments;
    }
  }


  setCalendarAppointments(List<Appointment> appointments){
    subject.sink.add(subject.value.setCalendarAppointments(appointments));
  }

  void patchAppointment(Appointment appointment) {
    AppointmentRepository.instance.patchAppointment(appointment);
    subject.sink.add(subject.value.patchAppointment(appointment));
  }

  patchAppointmentsBulk(List<Appointment> appointments){
    var model = subject.value;
    for(int i = 0; i <= appointments.length -1 ;i++){
      model = model.patchAppointment(appointments[i]);
    }
    subject.sink.add(model);
  }



}

final sidebarBloc = SidebarBloc();