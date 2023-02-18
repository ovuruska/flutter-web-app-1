


import 'package:scrubbers_employee_application/models/Appointment.dart';

import '../../../common/Bloc.dart';
import 'Model.dart';

class AppointmentSearchBloc  extends Bloc<AppointmentsSearchModel>{

  AppointmentSearchBloc() {
    subject.sink.add(AppointmentsSearchModel());
  }

  setCustomerName(String customerName){
    subject.sink.add(subject.value.setCustomerName(customerName));
  }
  setBranch(String? branch){
    subject.sink.add(subject.value.setBranch(branch));
  }

  setAppointmentStatus(String? status) {
    subject.sink.add(subject.value.setAppointmentStatus(status));
  }

  setIsLoading(bool isLoading){
    subject.sink.add(subject.value.setIsLoading(isLoading));
  }

  setAppointmentDate(DateTime? appointmentDate){
    subject.sink.add(subject.value.setAppointmentDate(appointmentDate));
  }

  setServiceType(String? serviceType){
    subject.sink.add(subject.value.setServiceType(serviceType));
  }

  setEmployee(String? employee){
    subject.sink.add(subject.value.setEmployee(employee));
  }

}

final appointmentSearchBloc = AppointmentSearchBloc();