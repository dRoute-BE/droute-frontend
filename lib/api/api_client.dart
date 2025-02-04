import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  // Base URL for the backend API
  final String baseUrl = 'http://10.0.2.2:8080/droute-user-service/api';
  // GET request
  Future<Map<String, dynamic>> get(String endpoint) async {
    final Uri url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.get(url);
    return _processResponse(response);
  }

  // POST request
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final Uri url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    return _processResponse(response);
  }

  // PUT request
  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> body) async {
    final Uri url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    return _processResponse(response);
  }

  // DELETE request
  Future<Map<String, dynamic>> delete(String endpoint) async {
    final Uri url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.delete(url);
    return _processResponse(response);
  }

  // Handling the response and checking for success
  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode <= 299 ) {
      return jsonDecode(response.body);  // Return response as a map if status is OK
    } else {
      throw Exception('Failed to load data: ${response.body}');
    }
  }

  Future<String> requestParam(String endpoint) async {
    final Uri url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'}, // If your API needs headers
    );
    if (response.statusCode == 200) {
      return response.body;  // Return the response body as a string
    } else {
      throw Exception('Failed to load data: ${response.body}');
    }
  }

}
