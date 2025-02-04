
import 'package:droute_frontend/api/auth_api.dart';

class AuthModel {
  final AuthApi _authApi = AuthApi(); // Initialize the API client

  // Login logic
  Future<Map<String, dynamic>> login(String emailOrPhone, String password) async {
    try {
      final response = await _authApi.login(emailOrPhone, password); // Call the API method
      return response;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  // Register logic
  Future<Map<String, dynamic>> register(String fullName, String password, String email, String contactNo) async {
    try {
      final response = await _authApi.register(fullName, password, email, contactNo);

      if (response.containsKey("message") && response["message"] == "User created Successfully.") {
        return response; // Return the valid response
      } else {
        throw Exception("Registration failed: ${response["message"] ?? "Unknown error"}");
      }
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }


  // otp request logic
  Future<String> otpRequest(String email) async {//returns sent otp
    try {
      final response = await _authApi.requestOtp(email); // Call the API method
      return response;
    } catch (e) {
      throw Exception('Otp request failed: $e');
    }
  }
}
