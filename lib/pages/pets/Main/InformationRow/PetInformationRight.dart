import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/common/StringUtils.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';
import 'package:scrubbers_employee_application/pages/pets/controller.dart';

import 'wrappers.dart';

class PetsMainInformationRowPetInformationRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: petsBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));


  DateTime? _lastAppointment(){
    var selectedPet = petsBloc.value.selectedPet;
    var petId = selectedPet?.id ?? "N/A";
    DateTime? lastAppointment = null;
    for(var appointment in sidebarBloc.value.calendarAppointments){
      if(appointment.dog.id == petId){
        if(lastAppointment == null){
          lastAppointment = appointment.start;
        }
        else if(appointment.start.isAfter(lastAppointment)){
          lastAppointment = appointment.start;
        }
      }
    }
    return lastAppointment;
  }

  int _averageServiceTime(){
    var selectedPet = petsBloc.value.selectedPet;
    var petId = selectedPet?.id ?? "N/A";
    var total = 0;
    var count = 0;
    for(var appointment in sidebarBloc.value.calendarAppointments){
      if(appointment.dog.id == petId){
        total += appointment.end.difference(appointment.start).inMinutes;
        count++;
      }
    }
    if(count == 0){
      return 0;
    }
    return (total / count).toInt();
  }

  double _petInvoice(){
    var selectedPet = petsBloc.value.selectedPet;
    var petId = selectedPet?.id ?? "N/A";
    var total = 0.0;
    for(var appointment in sidebarBloc.value.calendarAppointments){
      if(appointment.dog.id == petId){
        for (var service in appointment.services) {
          total += service.cost;
        }
        for(var product in appointment.products) {
          total += product.cost;
        }
        total += appointment.tip;
      }
    }
    return total;
  }

  bool _aggressive(){
    var selectedPet = petsBloc.value.selectedPet;
    var petId = selectedPet?.id ?? "N/A";
    var aggressive = false;
    for(var appointment in sidebarBloc.value.calendarAppointments){
      if(appointment.dog.id == petId){
        if(appointment.dog.specialHandling){
          aggressive = true;
        }
      }
    }
    return aggressive;
  }


  Widget _build(BuildContext context) {
    var coatType = "N/A";
    var lastAppointment = _lastAppointment();
    var lastAppointmentString = (lastAppointment == null) ? "N/A" : StringUtils.formatDate(lastAppointment);
    var averageServiceTime = _averageServiceTime();
    var petInvoice = _petInvoice();
    var aggressive = _aggressive();

    return Container(
        child: Row(children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            boldText("Coat type"),
            boldText("Last Appointment"),
            boldText("Average service time"),
            boldText("Pet invoice"),
            boldText("Aggressive"),
          ]),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            infoText(coatType),
            infoText(lastAppointmentString),
            infoText(averageServiceTime.toString()),
            infoText(petInvoice.toStringAsFixed(2)),
            infoText(aggressive ? "Yes" : "No"),
          ]),
        ]));
  }
}
