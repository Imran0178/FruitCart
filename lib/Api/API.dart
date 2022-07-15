import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:my_app/product.dart';

class ApiProvider {
  // Future<dynamic> get(String url) async {
  //   print('Called 3');
  //   const String _baseUrl = 'http://localhost:8080/Product';

  // }
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('http://localhost:8080/Product'));

    return parseProducts(response.body);
  }

  List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }
}
