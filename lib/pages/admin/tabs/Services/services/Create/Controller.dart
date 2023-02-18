import 'package:scrubbers_employee_application/common/Bloc.dart';

import 'Model.dart';


class ServicesCreateBloc  extends Bloc<ServicesCreateModel>{
  ServicesCreateBloc() {
    subject.sink.add(ServicesCreateModel());
  }

  setName(String serviceName){
    subject.sink.add(subject.value.setName(serviceName));
  }

  setEditMode(){
    subject.sink.add(subject.value.setEditMode());
  }

  setCreateMode(){
    subject.sink.add(subject.value.setCreateMode());
  }

  setDescription(String description){
    subject.sink.add(subject.value.setDescription(description));
  }

  setCost(String cost){
    subject.sink.add(subject.value.setCost(cost));
  }

  setDuration(String duration){
    subject.sink.add(subject.value.setDuration(duration));
  }

  setId(int id){
    subject.sink.add(subject.value.setId(id));
  }

  reset(){
    subject.sink.add(subject.value.reset());
  }



}

final servicesCreateBloc = ServicesCreateBloc();