

import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Service.dart';
import 'package:scrubbers_employee_application/repositories/service.dart';

import 'Model.dart';

class ServicesDataTableBloc extends Bloc<ServicesDataTableModel>{
  ServicesDataTableBloc() {
    subject.sink.add(ServicesDataTableModel());
  }

  setServices(List<ServiceModel> services){

    subject.sink.add(subject.value.setServices(services));
  }

  Future<bool> addService(ServiceModel service) async {
    var result = ServiceRepository.instance.addService(service).then((value) {
      if(value != null){
        subject.sink.add(subject.value.addService(value));
        return true;
      }else{
        return false;
      }
    });

    return result;
  }

  removeService(ServiceModel service) async{
    await ServiceRepository.instance.removeService(service).then((value) {
    });
    subject.sink.add(subject.value.removeService(service));
  }

  patchService(ServiceModel service) async{
    var result = ServiceRepository.instance.patchService(service).then((value) {
      if(value != null){
        subject.sink.add(subject.value.patchService(value));
        return true;
      }else{
        return false;
      }
    });

    return result;

  }


}

final servicesDataTableBloc = ServicesDataTableBloc();