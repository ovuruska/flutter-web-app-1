import 'dart:convert';

import 'package:scrubbers_employee_application/constants.dart';
import 'package:scrubbers_employee_application/models/Payroll.dart';
import 'package:http/http.dart' as http;

import 'utils.dart';

class PayrollRepository {
  static final instance = PayrollRepository._();
  PayrollRepository._();


  //
  // static String url = backendUrl;

  Future<List<PayrollModel>?> fetchAll(String branchName,{DateTime? start,DateTime? end}) async {
    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var client = http.Client();

    var route = "/api/payrolls?branch__name=$branchName";

    if(start != null){
      route += "&start=$start";
    }
    if(end != null){
      route += "&end=$end";
    }

    var uri = getUri(route);

    var response = await client.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      var payrolls = jsonObject.map<PayrollModel>((e) => PayrollModel.fromJson(e)).toList();
      return payrolls;
    } else {
      print(response.reasonPhrase);
      print(response.body);
      return null;
    }
  }

}