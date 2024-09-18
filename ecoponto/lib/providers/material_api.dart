import 'package:flutter_ecommerce/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final materialProvider = FutureProvider<List<MaterialModel>>((ref) async {
  final response = await http
      .get(Uri.parse('http://127.0.0.1:8000/materials/getmaterials/'));
  // .get(Uri.parse('http://10.0.2.2:8000/materials/getmaterials/'));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
    return jsonData.map((json) => MaterialModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load materials');
  }
});
