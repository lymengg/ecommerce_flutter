import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/app_config.dart';

class UserService {
  static Future<bool> login(String username, String password) async {
    print(username);
    print(password);

    // Example endpoint: baseUrl + '/login'
    final url = Uri.https(AppConfig().baseUrl, AppConfig().login);

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "password": password}),
      );

      print(response.statusCode);

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);

        // You can process token or user data here if your API returns it
        // e.g., SecureStorage.saveToken(data['token']);

        return true;
      } else {
        // Optionally log or parse error
        print('Login failed: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }
}
