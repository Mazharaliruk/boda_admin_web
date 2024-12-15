import 'dart:convert';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/api_urls.dart';
import '../../../models/account/admin_profile.dart';
import '../../../routes/route_manager.dart';
import '../../../utils/exceptions/common_exception.dart';
import '../inventry/category_repository.dart';

class AuthRepo {
  String? _accessToken;
  String? _refreshToken;

  /// Fetches the admin profile using the stored access token.
  Future<AdminProfile> fetchAdminProfile() async {
    const String url = ApiUrls.profile;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: await getHeaders(),
      );

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return AdminProfile.fromMap(data);
        case 401:
          throw UnauthorizedException(
              'Unauthorized: Invalid or missing token.');
        case 404:
          throw NotFoundException(
              'Not Found: The requested resource was not found.');
        default:
          throw CommonException(
              'Failed with status code ${response.statusCode}.');
      }
    } catch (e) {
      throw CommonException('An unexpected error occurred: $e');
    }
  }

  Future<void> login(String email, String password, BuildContext context) async {
  const String url = ApiUrls.login;

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password, 'role': "admin"}),
    );



    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        print(data['token']['access']);
        print(data['token']['refresh']);
        _accessToken = data['token']['access'];
        _refreshToken = data['token']['refresh'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', _accessToken!);
        await prefs.setString('refreshToken', _refreshToken!);

        Navigator.pushNamed(context, AppRoutes.mainMenuScreen);
        break;
      case 403:
        final errorData = json.decode(response.body);
        throw ForbiddenException(errorData['message'] ?? 'Forbidden access.');
      case 400:
        throw BadRequestException('Invalid credentials.');
      default:
        throw CommonException('Unexpected error occurred.');
    }
  } catch (e) {
    print('Login error: $e');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
  }
}


  /// Logs out the user by clearing stored tokens.
Future<void> logout(String refreshToken, String accessToken) async {
   const String url = ApiUrls.logout;
   print(refreshToken);
   


  try {
    // Make a POST request to the logout endpoint
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken', // Optional if needed
      },
      body: jsonEncode({
        'refresh_token': refreshToken,
      }),
    );

    if (response.statusCode == 200) {
      // Successfully logged out
      print('Logout successful');
      
      // Clear user data locally
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // Navigate to the login screen or clear stack
      // Example: Navigator.pushReplacementNamed(context, '/login');
    } else {
      // Handle logout failure
      print('Logout failed: ${response.body}');
    }
  } catch (e) {
    // Handle network errors
    print('Error during logout: $e');
  }
}

  /// Checks if the user is already logged in by verifying stored tokens.
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('accessToken');
    _refreshToken = prefs.getString('refreshToken');
    return _accessToken != null;
  }



 bool isTokenExpired(String token) {
  print(token);
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Invalid token');
  }

  final payload = utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
  final payloadMap = json.decode(payload) as Map<String, dynamic>;

  if (!payloadMap.containsKey('exp')) {
    throw Exception('Invalid token payload');
  }

  final expiry = DateTime.fromMillisecondsSinceEpoch(payloadMap['exp'] * 1000);
  return expiry.isBefore(DateTime.now());
}

}
