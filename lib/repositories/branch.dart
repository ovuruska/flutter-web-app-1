import 'dart:convert';

import 'package:scrubbers_employee_application/services/auth.dart';

import '../models/Branch.dart';


class BranchRepository {
  static final instance = BranchRepository._();

  BranchRepository._();


  Future<List<Branch>?> fetchAll() async {

    var response = await SchedulingAuthService.instance.request("/api/branch/all");
    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      var jsonObject = jsonDecode(responseString);
      var payrolls = jsonObject.map<Branch>((e) => Branch.fromJson(e)).toList();
      return payrolls;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<Branch> init() async {

    var response = await SchedulingAuthService.instance.request("/api/branch", method: "POST");

    var respString = await response.stream.bytesToString();
    return Branch.fromJson(jsonDecode(respString));
  }

  Future<bool> remove(int id) async {

    var response = await SchedulingAuthService.instance.request("/api/branch/${id.toString()}", method: "DELETE");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<Branch?> modify(Branch branch) async {
    var response = await SchedulingAuthService.instance.jsonRequest("/api/branch/${branch.id}", method: "PATCH", body: {
      "name": branch.name,
      "address": branch.address,
      "phone": branch.phone,
      "email": branch.email,
      "description": branch.description,
    });

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      return Branch.fromJson(jsonDecode(respString));
    }
    else {
      print(response.reasonPhrase);
    }
    return null;



  }
}