import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:http/http.dart' as http;

import 'credential.dart';
import 'scheduling_api.dart';
import 'token.dart';

class SchedulingAuthService {
  final tokenProvider = TokenService.instance;
  final credentialProvider = CredentialService.instance;
  final apiProvider = SchedulingApiService.instance;

  static final SchedulingAuthService instance = SchedulingAuthService._();

  SchedulingAuthService._();

  init() async {
    await credentialProvider.init();
    await tokenProvider.init();
    var creds = credentialProvider.get();
    if (creds["username"] != null && creds["password"] != null) {
      _setCredentials(
        username: creds["username"]!,
        password: creds["password"]!,
      );
    }
  }

  _setCredentials({
    required String username,
    required String password,
  }) async {
    var result = await _login(username, password);
    if (result) {
      await credentialProvider.set(username: username, password: password);
      return true;
    } else {
      credentialProvider.clear();
      return false;
    }
  }

  factory SchedulingAuthService({String? username, String? password}) {
    if (username == null || password == null) {
      return instance;
    }
    instance._setCredentials(username: username, password: password);
    return instance;
  }

  Future<bool> login(String username, String password) async {
    return await _login(username, password);
  }

  bool isLogged() {
    var token = tokenProvider.get();

    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<http.StreamedResponse> request(String route,
      {String body = "",
      String method = "GET",
        Map<String,String> headers = const {},
      Map<String, dynamic> queryParams = const {}}) async {
    var token = tokenProvider.get();
    var response = await apiProvider.request(route,
        body: body, method: method, token: token, queryParams: queryParams);

    return response;
  }

  logout() {
    tokenProvider.clear();
    credentialProvider.clear();
  }

  Future<http.StreamedResponse> jsonRequest(
    String route, {
    dynamic body = const {},
    String method = "POST",
        Map<String,String> headers = const {},
    Map<String, dynamic> queryParams = const {},
  }
      )
  {
    var requestHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    requestHeaders.addAll(headers);
    var token = tokenProvider.get();
    var response = apiProvider.request(route,
        body: jsonEncode(body), method: method, token: token, queryParams: queryParams, headers: requestHeaders);

    return response;
  }


  Future<bool> _login(String username, String password) async {
    if (username == null || password == null) {
      throw Exception("Username and password must be set before logging in");
    }

    var body = {"username": username, "password": password};

    return await apiProvider
        .jsonRequest("/api/auth/employee/login",
            body: body, method: "POST")
        .then((resp) async {
      if (resp.statusCode != 200) {
        return false;
      }
      var respString = await resp.stream.bytesToString();
      var data = jsonDecode(respString);
      var token = data["token"];
      tokenProvider.set(token);
      return true;
    });
  }
}
