import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constants.dart';

class SchedulingApiService {
  static final SchedulingApiService instance = SchedulingApiService._();

  SchedulingApiService._();

  static Uri getUri(String path, {Map<String, dynamic>? queryParams}) =>
      Uri.parse('$backendUrl$path').replace(queryParameters: queryParams);


  Future<http.StreamedResponse> jsonRequest(String route,
      {Map<String,dynamic> body = const{},
        String method = "GET",
        String? token,
        Map<String,String> headers = const {},
        Map<String, dynamic> queryParams = const {}}) async {
    late Uri url;
    if (queryParams.isNotEmpty) {
      url = getUri(route, queryParams: queryParams);
    } else {
      url = getUri(route);
    }

    final request = await http.Request(method, url);
    request.headers.addAll(
      {"Content-Type": "application/json", "Accept": "application/json"}
    );
    request.headers.addAll(headers);

    if (body.isNotEmpty) {
      request.body = jsonEncode(body);
    }

    final response = await request.send();
    return response;

  }

  Future<http.StreamedResponse> request(String route,
      {String body = "",
      String method = "GET",
      String? token,
        Map<String,String> headers = const {},
      Map<String, dynamic> queryParams = const {}}) async {
    late Uri url;
    if (queryParams.isNotEmpty) {
      url = getUri(route, queryParams: queryParams);
    } else {
      url = getUri(route);
    }

    final request = await http.Request(method, url);
    request.headers.addAll(headers);
    if (body.isNotEmpty) {
      request.body = body;
    }

    if (token != null) {
      request.headers.addAll({"Authorization": "Token $token"});
    }

    final response = await request.send();
    return response;
  }
}
