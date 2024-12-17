import 'dart:convert';
import 'dart:io';

import '../../../core/constants/api_urls.dart';
import 'package:http/http.dart' as http;

import '../../../models/inventry/promotion_model.dart';
import '../../../utils/exceptions/common_exception.dart';
import 'category_repository.dart';

class PromotionRepository {
  // update fetch promotion
  Future<List<PromotionModel>> fetchPromotion() async {
    const String url = ApiUrls.promotion;

    try {
      final response =
          await http.get(Uri.parse(url), headers: await getHeaders());

      // Check response status
      switch (response.statusCode) {
        case 200:
          // Parse and validate data
          final data = json.decode(response.body);
          if (data is List) {
            // Ensure all elements in the list are properly typed
            return data.map<PromotionModel>((item) {
              if (item is Map<String, dynamic>) {
                try {
                  return PromotionModel.fromMap(item);
                } catch (e) {
                  throw FormatException("Unexpected data format: $item");
                }
              } else {
                throw FormatException("Unexpected data format: $item");
              }
            }).toList();
          } else {
            throw FormatException(
                "Expected a list but got: ${data.runtimeType}");
          }
        case 400:
          throw BadRequestException(
              'Bad Request: Invalid parameters provided.');
        case 401:
          throw UnauthorizedException(
              'Unauthorized: Invalid or missing token.');
        case 403:
          throw ForbiddenException(
              'Forbidden: Access to the resource is denied.');
        case 404:
          throw NotFoundException(
              'Not Found: The requested resource was not found.');
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

  Future<void> createPromotion(Map<String, dynamic> data, String fieldName,
      [File? imageFile]) async {
    const String url = ApiUrls.promotion; // Endpoint for creating a promotion

    try {
      // Prepare request
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add headers
      request.headers.addAll(await getHeaders());

      // Add fields
      data.forEach((key, value) {
        if (value != null) request.fields[key] = value.toString();
      });

      // Add the image file if provided
      if (imageFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            fieldName, // Match the Django model field name
            imageFile.path,
          ),
        );
      }

      // Send the request
      var streamedResponse = await request.send();

      // Read and handle response
      var response = await http.Response.fromStream(streamedResponse);

      switch (response.statusCode) {
        case 200:
        case 201:
          print('promotion saved successfully');
          return;
        case 400:
          throw BadRequestException('Bad Request: Invalid data for save.');
        case 401:
          throw UnauthorizedException(
              'Unauthorized: Invalid or missing token.');
        case 403:
          throw ForbiddenException(
              'Forbidden: You do not have permission to save this promotion.');
        case 404:
          throw NotFoundException('Not Found: The promotion does not exist.');
        case 500:
        case 502:
        case 503:
        case 504:
          throw InternalServerException(
              'Server Error: Something went wrong on the server side.');
        default:
          throw UnknownException(
              'Unknown Error: Save failed with status code ${response.statusCode}.');
      }
    } on http.ClientException catch (e) {
      throw NetworkException('Network Error: $e');
    } on FormatException catch (e) {
      throw CommonException('Data Format Error: $e');
    } catch (e) {
      throw UnknownException('An unexpected error occurred: $e');
    }
  }

  Future<void> createTextPromotion(Map<String, dynamic> data) async {
    const String url = ApiUrls.promotion;

    // Convert DateTime values to strings
    data = data.map((key, value) {
      if (value is DateTime) {
        return MapEntry(key,
            value.toIso8601String()); // Convert DateTime to ISO 8601 string
      }
      return MapEntry(key, value);
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: await getHeaders(),
        body: json.encode(data),
      );

      switch (response.statusCode) {
        case 200: // Success
        case 201: // Resource created successfully
          print('Promotion created successfully!');
          break;
        case 400:
          throw BadRequestException(
              'Bad Request: Invalid parameters provided.');
        case 401:
          throw UnauthorizedException(
              'Unauthorized: Invalid or missing token.');
        case 404:
          throw NotFoundException(
              'Not Found: The requested resource was not found.');
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

  Future<PromotionModel> updatePromotion(PromotionModel promotion) async {
    final String url =
        '${ApiUrls.promotion}/${promotion.id}'; // Add ID to endpoint

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: await getHeaders(),
        body: json.encode(promotion.toMap()), // Serialize model to JSON
      );

      switch (response.statusCode) {
        case 200: // Success
          final data = json.decode(response.body);
          if (data is Map<String, dynamic>) {
            return PromotionModel.fromMap(data);
          } else {
            throw FormatException("Unexpected data format: $data");
          }
        case 400:
          throw BadRequestException(
              'Bad Request: Invalid parameters provided.');
        case 401:
          throw UnauthorizedException(
              'Unauthorized: Invalid or missing token.');
        case 404:
          throw NotFoundException(
              'Not Found: The requested resource was not found.');
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

  Future<void> deletePromotion(int promotionId) async {
    final String url =
        '${ApiUrls.promotion}/$promotionId'; // Add ID to endpoint

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: await getHeaders(),
      );

      switch (response.statusCode) {
        case 204: // No Content (successfully deleted)
          return; // No response body to handle
        case 400:
          throw BadRequestException(
              'Bad Request: Invalid parameters provided.');
        case 401:
          throw UnauthorizedException(
              'Unauthorized: Invalid or missing token.');
        case 404:
          throw NotFoundException(
              'Not Found: The requested resource was not found.');
        default:
          throw UnknownException(
              'Unknown Error: Failed with status code ${response.statusCode}.');
      }
    } on http.ClientException catch (e) {
      throw NetworkException('Network Error: $e');
    } catch (e) {
      throw UnknownException('An unexpected error occurred: $e');
    }
  }
}
