import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final authProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthService {
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/materials/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'email': email,
          'password': password,
        },
      ),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
