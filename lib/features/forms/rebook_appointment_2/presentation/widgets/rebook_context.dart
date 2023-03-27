import 'package:flutter/material.dart';

import '../../../../../core/domain/entities/branch_entity.dart';
import '../../../../../core/domain/entities/client_entity.dart';
import '../../../../../core/domain/entities/employee_entity.dart';
import '../../../../../core/domain/entities/pet_entity.dart';
import '../../../../../core/domain/entities/product_entity.dart';



class RebookContext extends ChangeNotifier {
  ClientEntity? client;
  PetEntity? pet;
  String? service;
  int? duration;
  DateTime startDate;
  late List<ProductEntity> products;
  late List<EmployeeEntity> groomers;
  late List<BranchEntity> branches;

  RebookContext(
  {
    this.client,
    this.pet,
    this.service,
    this.duration,
    required this.startDate,
    this.products = const [],
    this.groomers = const [],
    this.branches = const [],
  });

  setClient(ClientEntity? value){
    client = value;
    notifyListeners();
    return this;
  }
  setPet(PetEntity? value){
    pet = value;
    notifyListeners();
    return this;
  }
  setService(String? value){
    service = value;
    notifyListeners();
    return this;
  }
  setDuration(int? value){
    duration = value;
    notifyListeners();
    return this;
  }
  setStartDate(DateTime value){
    startDate = value;
    notifyListeners();
    return this;
  }
  setProducts(List<ProductEntity> value){
    products = value;
    notifyListeners();
    return this;
  }
  setGroomers(List<EmployeeEntity> value){
    groomers = value;
    notifyListeners();
    return this;
  }
  setBranches(List<BranchEntity> value){
    branches = value;
    notifyListeners();
    return this;
  }


}
