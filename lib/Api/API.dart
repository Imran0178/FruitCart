import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:my_app/addnewfruit.dart';
import 'package:my_app/product.dart';

class ApiProvider with ChangeNotifier {
  // Future<dynamic> get(String url) async {
  //   print('Called 3');
  //   const String _baseUrl = 'http://localhost:8080/Product';

  // }
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('http://localhost:8080/Product'));

    return parseProducts(response.body);
  }

  Future<Product> postProducts(String title) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/Product'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: title,
    );
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Product.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create product.');
    }
  }

 Future<Product> editProducts(String title) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/Product/Edit'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: title,
    );
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Product.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to edit the product.');
    }
  }

  void deleteproduct(String id) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/Product/Delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: id,
    );
    // print(response.body);
    // print(response.statusCode);
  }

  // if (response.statusCode == 200) {
  //   return Product.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception('Failed to delete album.');
  // }


  List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  // List<AddFruitForm> addProducts(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  //   return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  // }

}
