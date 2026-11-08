import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration _timeout = Duration(seconds: 10);

  // ---------- POST: Create New Post ----------
  Future<Post> createPost(String title, String body) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/posts'),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({
              'title': title,
              'body': body,
              'userId': 1, // API requirement
            }),
          )
          .timeout(_timeout);

      if (response.statusCode == 201) {
        // 201 = Created (POST success status)
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return Post.fromJson(jsonResponse);
      } else {
        throw ApiException('Server error: ${response.statusCode}');
      }
    } on http.ClientException {
      throw const ApiException('Network error. Check your internet.');
    } catch (e) {
      throw ApiException('Failed to create post: $e');
    }
  }
}

class ApiException implements Exception {
  final String _message;
  const ApiException(String message) : _message = message;
  String get message => _message;
  @override
  String toString() => _message;
}
