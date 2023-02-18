

import 'package:scrubbers_employee_application/models/Pet.dart';

class PetsViewModel {

  String dogQuery = "";
  String clientQuery = "";
  PetModel ?selectedPet ;
  List<PetModel> ? pets;

  setPets(List<PetModel> pets){
    this.pets = pets;
    return this;
  }

  setSelectedPet(PetModel dog){
    this.selectedPet = dog;
    return this;
  }

  setClientQuery(String value){
    this.clientQuery = value;
    return this;
  }

  setDogQuery(String value){
    this.dogQuery = value;
    return this;
  }



}