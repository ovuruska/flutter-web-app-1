



import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Pet.dart';

import 'model.dart';

class PetsBloc extends Bloc<PetsViewModel> {
  PetsBloc() {
    subject.sink.add(PetsViewModel());
  }

  setClientQuery(String? query){
    if(query == null) query = "";
    subject.sink.add(subject.value.setClientQuery(query));
  }

  clearClientQuery(){
    subject.sink.add(subject.value.setClientQuery(""));
  }

  setDogQuery(String? query){
    if(query == null) query = "";
    subject.sink.add(subject.value.setDogQuery(query));
  }

  clearDogQuery(){
    subject.sink.add(subject.value.setDogQuery(""));
  }

  setSelectedPet(PetModel dog){
    subject.sink.add(subject.value.setSelectedPet(dog));
  }
  setPets(List<PetModel> pets){
    subject.sink.add(subject.value.setPets(pets));
  }
  List<PetModel> getQueryResults() {
    if(subject.value.pets == null )return [];
    else{
      return subject.value.pets!.where((element) {
        if(subject.value.clientQuery == "" || element.owner.name.toLowerCase().contains(subject.value.clientQuery.toLowerCase())) {
          if(subject.value.dogQuery == "" || element.name.toLowerCase().contains(subject.value.dogQuery.toLowerCase())) {
            return true;
          }
        }
        return false;
      }).toList();
    }
  }

}

final petsBloc = PetsBloc();