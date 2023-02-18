import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';

import '../../controller.dart';
import 'Model.dart';

class PetsMainDataTableBloc extends Bloc<PetsMainDataTableModel> {
  PetsMainDataTableBloc() {
    subject.sink.add(PetsMainDataTableModel());
  }

  filter(List<Appointment> allAppointments){
    List<Appointment> appointments;
    var selectedPet = petsBloc.value.selectedPet;
    if (selectedPet == null)
      appointments = [];
    else {
      appointments = allAppointments.where((appointment) {
        return selectedPet.id == appointment.dog.id;
      }).toList();
    }
    return appointments;
  }

  update(){
    var appointments = filter(value.appointments);
    subject.sink.add(subject.value.setFiltered(appointments));
  }

  setAppointments(List<Appointment> allAppointments) {
    var appointments = filter(allAppointments);

    subject.sink.add(subject.value.setAppointments(allAppointments).setFiltered(appointments));
  }
}

final petsMainDataTableBloc = PetsMainDataTableBloc();