
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_urls.dart';
import '../../utils/exceptions/common_exception.dart';

class CategoryRepository {

  Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Replace with actual token
    };
  }



// Method to fetch categories
  Future<List<dynamic>> fetchCategories() async {
    const String url = ApiUrls.categories;

    try {
      final response = await http.get(Uri.parse(url), headers: getHeaders());

      // Check response status and handle specific errors
      switch (response.statusCode) {
        case 200:
          // Parse and return data
          final data = json.decode(response.body);
          return data['results'] ?? [];
        case 400:
          throw BadRequestException('Bad Request: Invalid parameters provided.');
        case 401:
          throw UnauthorizedException('Unauthorized: Invalid or missing token.');
        case 403:
          throw ForbiddenException('Forbidden: Access to the resource is denied.');
        case 404:
          throw NotFoundException('Not Found: The requested resource was not found.');
        case 500:
        case 502:
        case 503:
        case 504:
          throw InternalServerException(
              'Server Error: Something went wrong on the server side.');
        default:
          throw UnknownException(
              'Unknown Error: Failed with status code ${response.statusCode}.');
      }
    } on http.ClientException catch (e) {
      // Handle network-related exceptions
      throw NetworkException('Network Error: $e');
    } on FormatException catch (e) {
      // Handle JSON decoding issues
      throw CommonException('Data Format Error: $e');
    } catch (e) {
      // Handle other unknown errors
      throw UnknownException('An unexpected error occurred: $e');
    }
  }
}