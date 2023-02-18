import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:scrubbers_employee_application/models/Pet.dart';
import 'package:scrubbers_employee_application/repositories/utils.dart';

class PetRepository{
  static final PetRepository instance = PetRepository._();
  PetRepository._();

  Future<List<PetModel>?> fetchAll() async {
    var uri = getUri("/api/pets");
    var request = http.Request('GET', uri);


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var jsonMap = jsonDecode(respString);
      return jsonMap.map<PetModel>((e) => PetModel.fromJson(e)).toList();
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }
}