import 'dart:convert';

import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:flutter_ecommerce/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final userProvider = FutureProvider<User>((ref) async {
  final email = await AuthService().getUserEmail();

  final response = await http.get(
      // Uri.parse('http://10.0.2.2:8000/materials/user_search/?email=${email}'));
      Uri.parse('http://127.0.0.1:8000/materials/user_search/?email=${email}'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
    if (jsonData.isNotEmpty) {
      return User.fromJson(
        jsonData.first,
      );
    } else {
      throw Exception('Usuário não encontrado');
    }
  } else {
    throw Exception('Falha ao carregar usuário');
  }
});
