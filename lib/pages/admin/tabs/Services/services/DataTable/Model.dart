

import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/models/Service.dart';

class ServicesDataTableModel {

  List<ServiceModel> services = [];

  setServices(List<ServiceModel> services){
    this.services = services;
    return this;
  }

  addService(ServiceModel service){
    this.services.add(service);
    return this;
  }

  removeService(ServiceModel service){
    this.services.remove(service);
    return this;
  }

  patchService(ServiceModel updatedService){
    this.services = this.services.map((service) {
      if(service.id == updatedService.id) return updatedService;
      else return service;
    }).toList();
    return this;
  }


}