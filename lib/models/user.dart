import 'dart:convert';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    username: json['username'],
    email: json['email'],
    phone: json['phone'],
    website: json['website'],
  );

  static List<User> fromJsonList(String body) {
    final List<dynamic> jsonData = jsonDecode(body);
    return jsonData.map((json) => User.fromJson(json)).toList();
  }
}
