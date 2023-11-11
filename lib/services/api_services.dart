import 'dart:convert';
import 'package:http/http.dart' as http;

class MockApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com/';
  static const usersEndpoint = '/users';

  static String get usersUrl => '$baseUrl$usersEndpoint';

  static Future<List<Map<String, dynamic>>> getMockUsers() async {
    final mockUsers = [
      {'id': 1, 'name': 'John Doe', 'email': 'pontes', 'password': 'pontes'},
      {'id': 2, 'name': 'rogerio', 'email': 'admin', 'password': 'admin'},
      {'id': 3, 'name': 'roberto', 'email': 'roberto', 'password': '123'},
      {'id': 4, 'name': 'Smith', 'email': 'admin', 'password': '123'},
      {'id': 5, 'name': 'robert', 'email': 'teste', 'password': 'teste'},
    ];

    final jsonData = jsonEncode(mockUsers);

    final mockResponse = http.Response(jsonData, 200);

    print('Mock API Response: ${mockResponse.body}');
    return mockUsers;
  }
}
