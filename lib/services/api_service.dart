import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart'; // for compute()
import '../models/user.dart';

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      // Offload JSON parsing from main thread
      return compute(User.fromJsonList, response.body);
    } else {
      throw Exception('Failed to load users. Status: ${response.statusCode}');
    }
  }
}
