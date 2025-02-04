import 'package:droute_frontend/api/api_client.dart';

class AuthApi {
  final ApiClient apiClient = ApiClient();

  // Login API
  Future<Map<String, dynamic>> login(String emailOrPhone, String password) async {
    // final body = {
    //   'emailOrPhone': emailOrPhone,
    //   'password': password,
    // };
    return await apiClient.get('user/auth/login?emailOrPhone=$emailOrPhone&password=$password');
  }


  // Register API
  Future<Map<String, dynamic>> register(String fullName, String password, String email,String contactNo) async {
    final body = {
      'fullName': fullName,
      'email': email,
      'password': password,
      'contactNo':contactNo,
      'role':"user"

    };
    return await apiClient.post('user/', body);
  }

  // OTP Request API
  Future<String> requestOtp(String emailId) async {
    return await apiClient.requestParam('user/auth/sendOTP?email='+emailId);
  }
}
