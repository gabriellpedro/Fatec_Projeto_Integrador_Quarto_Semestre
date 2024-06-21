import 'dart:convert';
import 'package:flutter_ecommerce/model/ecoponto_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final ecopontoProvider = FutureProvider<List<EcopontoModel>>((ref) async {
  final response = await http
      // .get(Uri.parse('http://10.0.2.2:8000/materials/ecopontos/'));
      .get(Uri.parse('http://127.0.0.1:8000/materials/ecopontos/'));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((json) => EcopontoModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load EcoPonto locations');
  }
});
