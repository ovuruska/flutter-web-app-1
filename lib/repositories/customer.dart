import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scrubbers_employee_application/models/Customer.dart';
import 'package:scrubbers_employee_application/models/CustomerDetails.dart';
import 'package:scrubbers_employee_application/repositories/utils.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

class CustomerRepository {
  static final CustomerRepository instance = CustomerRepository._();

  CustomerRepository._();

  Future<CustomerDetails> getCustomerDetails(int id) async {
    var response = await SchedulingAuthService.instance.request("/api/scheduling/customer/$id");

    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    var result = CustomerDetails.fromJson(respJson);
    return result;
  }

  Future<List<Customer>?> fetchAll() async {
    var uri = getUri("/api/customers");
    var request = http.Request('GET', uri);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var jsonMap = jsonDecode(respString);
      return jsonMap.map<Customer>((e) => Customer.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
