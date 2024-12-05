
import 'dart:convert';

import '../../../core/constants/api_urls.dart';
import 'package:http/http.dart' as http;

import '../../../models/inventry/promotion_model.dart';
import '../../../utils/exceptions/common_exception.dart';
import 'category_repository.dart';

class PromotionRepository {


  // update fetch promotion
  Future<List<PromotionModel>> fetchCategories() async {
  const String url = ApiUrls.promotion;

  try {
    final response = await http.get(Uri.parse(url), headers: getHeaders());

    // Check response status
    switch (response.statusCode) {
      case 200:
        // Parse and validate data
        final data = json.decode(response.body);
        if (data is List) {
          // Ensure all elements in the list are properly typed
          return data.map<PromotionModel>((item) {
            if (item is Map<String, dynamic>) {
              print(item);
              return PromotionModel.fromMap(item);
            } else {
              throw FormatException("Unexpected data format: $item");
            }
          }).toList();
        } else {
          throw FormatException("Expected a list but got: ${data.runtimeType}");
        }
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
    throw NetworkException('Network Error: $e');
  } on FormatException catch (e) {
    throw CommonException('Data Format Error: $e');
  } catch (e) {
    throw UnknownException('An unexpected error occurred: $e');
  }
}
}