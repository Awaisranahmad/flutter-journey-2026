import 'dart:async';
import 'dart:convert';
import 'package:day_07_http_api/models/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration _timeout = Duration(seconds: 10);

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse('$_baseUrl/users'))
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList =
            jsonDecode(response.body) as List<dynamic>;
        return jsonList
            .map((json) => User.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
          'Failed to load users. Status code: ${response.statusCode}',
        );
      }
    } on TimeoutException {
      throw Exception(
        'The request timed out after ${_timeout.inSeconds} seconds.',
      );
    } catch (e) {
      throw Exception('An error occurred while fetching users: $e');
    }
  }
}
