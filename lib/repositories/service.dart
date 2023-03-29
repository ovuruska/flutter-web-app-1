import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:scrubbers_employee_application/models/Service.dart';
import 'package:scrubbers_employee_application/services/auth.dart';


class ServiceRepository {
  static final ServiceRepository instance = ServiceRepository._();

  ServiceRepository._();

  Future<List<ServiceModel>?> fetchAll() async {
    var response = await SchedulingAuthService.instance.request(
      "/api/services/all",
      method: "GET",
    );
    try {
      if (response.statusCode == 200) {
        var jsonString = await response.stream.bytesToString();
        var jsonMap = jsonDecode(jsonString);
        var services =
            jsonMap.map<ServiceModel>((e) => ServiceModel.fromJson(e)).toList();
        return services;
      } else {
        throw Exception("Failed to load services");
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<ServiceModel?> addService(ServiceModel service) async {

    var json = service.toJson();
    if (json.containsKey("id")) {
      json.remove("id");
    }
    var response = await SchedulingAuthService.instance.jsonRequest(
      "/api/service",
      method: "POST",
      body: json,
    );
    if (response.statusCode == 201) {
      var respString = await response.stream.bytesToString();
      var jsonObject = jsonDecode(respString);
      var serviceObject = ServiceModel.fromJson(jsonObject);

      return serviceObject;
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

  Future<bool> removeService(ServiceModel service) async {
    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    var response = await SchedulingAuthService.instance.request(
      "/api/services//${service.id}",
      method: "DELETE",
      headers: headers,
    );
    if (response.statusCode == 204) {
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<ServiceModel?> patchService(ServiceModel service) async {

    var body = {
      "name": service.name ,
      "description": service.description ,
      "cost": service.cost ,
      "duration":
          "${service.duration.inHours}:${service.duration.inMinutes % 60}:00",
    };

    var response = await SchedulingAuthService.instance.jsonRequest(
      "/api/service/${service.id}",
      method: "PATCH",
      body: body,
    );

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var json = jsonDecode(respString);
      return ServiceModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
