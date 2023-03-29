

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scrubbers_employee_application/models/Product.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import 'utils.dart';

class ProductRepository {
  static final ProductRepository instance = ProductRepository._();

  ProductRepository._();


  Future<List<Product>?> fetchAll() async {

    var response = await SchedulingAuthService.instance.request("/api/products/all");
    try {
      if (response.statusCode == 200) {
        var jsonString = await response.stream.bytesToString();
        var jsonMap = json.decode(jsonString);
        var products =
        jsonMap.map<Product>((e) => Product.fromJson(e)).toList();
        return products;
      } else {
        throw Exception("Failed to load products");
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<Product?> addService(Product product) async {
    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var client = http.Client();
    var uri = getUri("/api/product");


    var json = product.toJson();
    if (json.containsKey("id")) {
      json.remove("id");
    }
    var response =
    await client.post(uri, headers: headers, body: jsonEncode(json));
    if (response.statusCode == 201) {
      var jsonObject = jsonDecode(response.body);
      var productObject = Product.fromJson(jsonObject);

      return productObject;
    } else {
      print(response.reasonPhrase);
      print(response.body);
    }
    return null;
  }

  Future<bool> removeService(Product product) async {
    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var client = http.Client();
    var uri = getUri("/api/product/${product.id}");


    var response = await client.delete(uri, headers: headers);
    if (response.statusCode == 204) {
      return true;
    } else {
      print(response.reasonPhrase);
      print(response.body);
      return false;
    }
  }

  Future<Product?> patchService(Product product) async{
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var uri = getUri("/api/product/${product.id}");
    var request = http.Request('PATCH', uri);

    request.body = json.encode({
      "name":product.name,
      "description" : product.description,
      "cost":product.cost ,

    });
    request.headers.addAll(headers);


    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var json = jsonDecode(respString);
      return Product.fromJson(json);

    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

}
