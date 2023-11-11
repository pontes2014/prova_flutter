import 'dart:convert';
import 'package:http/http.dart' as http;

class MockApiService {
  static Future<List<Map<String, dynamic>>> getMockUsers() async {
    final mockUsers = [
      {'id': 1, 'email': 'pontes', 'password': 'pontes'},
      {'id': 2, 'email': 'admin', 'password': 'admin'},
      {'id': 3, 'email': 'roberto', 'password': '123'},
      {'id': 4, 'email': 'admin', 'password': '123'},
      {'id': 5, 'email': 'teste', 'password': 'teste'},
    ];

    final jsonData = jsonEncode(mockUsers);

    final mockResponse = http.Response(jsonData, 200);

    return mockUsers;
  }
}
