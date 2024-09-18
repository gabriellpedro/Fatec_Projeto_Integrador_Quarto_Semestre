import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final authProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthService {
  final storage = const FlutterSecureStorage();

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/materials/login/'),
      // Uri.parse('http://10.0.2.2:8000/materials/login/'),
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
      var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      String userEmail = jsonResponse['email'];
      int userId = jsonResponse['user_id'];

      await storage.write(key: 'email', value: userEmail);
      await storage.write(key: 'user_id', value: userId.toString());

      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    await storage.delete(key: 'email');
  }

  Future<String?> getUserEmail() async {
    return await storage.read(key: 'email');
  }

  Future<String?> getUserId() async {
    return await storage.read(key: 'user_id');
  }
}
