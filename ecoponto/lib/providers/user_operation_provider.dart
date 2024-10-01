import 'dart:convert';
import 'package:flutter_ecommerce/model/user_operation_model.dart';
import 'package:flutter_ecommerce/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final userOperationProvider = FutureProvider<UserOperationModel>((ref) async {
  final userId = await AuthService().getUserId();

  final response = await http.get(Uri.parse(
      'http://127.0.0.1:8000/materials/operation/?user_id_occurrence=${userId}'));
      // 'http://10.0.2.2:8000/materials/operation/?user_id_occurrence=${userId}'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
    if (jsonData.isNotEmpty) {
      return UserOperationModel.fromJson(
        jsonData.first as Map<String, dynamic>,
      );
    } else {
      throw Exception('Valores de transações não encontrados.');
    }
  } else {
    throw Exception('Falha ao carregar dados do usuário.');
  }
});
