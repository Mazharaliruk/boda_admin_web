import 'dart:convert';
import 'dart:io';

import 'package:admin_boda/models/inventry/discount_model.dart';

import '../../../core/constants/api_urls.dart';
import '../../../utils/exceptions/common_exception.dart';
import 'category_repository.dart';
import 'package:http/http.dart' as http;

class DiscountRepository {
  Future<List<DiscountModel>> fetchDiscount() async {
    const String url = ApiUrls.dicount;

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
            return data.map<DiscountModel>((item) {
              if (item is Map<String, dynamic>) {
                print(item);
                return DiscountModel.fromMap(item);
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

Future<void> saveDiscount(Map<String, dynamic> data, [File? imageFile]) async {
  const url = ApiUrls.dicount;

  // Convert DateTime values to ISO 8601 string format
  data = data.map((key, value) {
    if (value is DateTime) {
      return MapEntry(key, value.toIso8601String()); // Convert DateTime to ISO 8601 string
    }
    return MapEntry(key, value);
  });

  try {
    // Prepare request
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add headers
    request.headers.addAll(await getHeaders());

    // Add fields (data) to request body
    data.forEach((key, value) {
      if (value != null) {
        request.fields[key] = value.toString(); // Ensure that all values are converted to strings
      }
    });

    // Add the image file if provided
    if (imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'image_url', // Ensure this matches the field name in your Django model
        imageFile.path,
      ));
    }

    // Log the request being sent (useful for debugging)
    print('Sending request with data: ${json.encode(data)}');
    if (imageFile != null) {
      print('Adding image file: ${imageFile.path}');
    }

    // Send the request
    var streamedResponse = await request.send();

    // Read and handle the response
    var response = await http.Response.fromStream(streamedResponse);

    // Log the response status and body for debugging
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    // Handle different response statuses
    switch (response.statusCode) {
      case 200:
      case 201:
        print('Discount saved successfully!');
        return;
      case 400:
        throw BadRequestException('Bad Request: Invalid data for save.');
      case 401:
        throw UnauthorizedException('Unauthorized: Invalid or missing token.');
      case 403:
        throw ForbiddenException('Forbidden: You do not have permission to save this discount.');
      case 404:
        throw NotFoundException('Not Found: The requested resource does not exist.');
      case 500:
      case 502:
      case 503:
      case 504:
        throw InternalServerException('Server Error: Something went wrong on the server side.');
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



// Fetch a single Discount by ID
Future<DiscountModel?> fetchDiscountById(int id) async {
  final url = '${ApiUrls.dicount}$id/'; // Adjusted endpoint for fetching by ID
  print(url);

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: await getHeaders(), // Add headers if required
    );

    // Handle response status codes
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body); // Parse the response JSON
        print(data);
        return DiscountModel.fromMap(data); // Convert JSON to TaxModel
      case 400:
        throw BadRequestException('Bad Request: Invalid data for fetching.');
      case 401:
        throw UnauthorizedException('Unauthorized: Invalid or missing token.');
      case 403:
        throw ForbiddenException('Forbidden: You do not have permission to view this tax.');
      case 404:
      print('Not Found: The requested tax does not exist.');
        return null;
      case 500:
      case 502:
      case 503:
      case 504:
        throw InternalServerException('Server Error: Something went wrong on the server side.');
      default:
        throw UnknownException(
            'Unknown Error: Fetch failed with status code ${response.statusCode}.');
    }
  } on http.ClientException catch (e) {
    throw NetworkException('Network Error: $e');
  } on FormatException catch (e) {
    throw CommonException('Data Format Error: $e');
  } catch (e) {
    throw UnknownException('An unexpected error occurred: $e');
  }
}



// Update category
  Future<void> updateDiscount(DiscountModel data) async {
    final url = '${ApiUrls.dicount}${data.id}/';
    print(url);
    print(data.toMap());

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: await getHeaders(),
        body: json.encode(data.toMap()), // Ensure data is serialized correctly
      );

      // Handle response status codes
      switch (response.statusCode) {
        case 200:
          print('Discount updated successfully');
          return;
        case 400:
          throw BadRequestException('Bad Request: Invalid data for update.');
        case 401:
          throw UnauthorizedException(
              'Unauthorized: Invalid or missing token.');
        case 403:
          throw ForbiddenException(
              'Forbidden: You do not have permission to update this category.');
        case 404:
          throw NotFoundException('Not Found: The Discount does not exist.');
        case 500:
        case 502:
        case 503:
        case 504:
          throw InternalServerException(
              'Server Error: Something went wrong on the server side.');
        default:
          throw UnknownException(
              'Unknown Error: Update failed with status code ${response.statusCode}.');
      }
    } on http.ClientException catch (e) {
      throw NetworkException('Network Error: $e');
    } on FormatException catch (e) {
      throw CommonException('Data Format Error: $e');
    } catch (e) {
      throw UnknownException('An unexpected error occurred: $e');
    }
  }

// Delete category
  Future<void> deleteDiscount(int id) async {
    final url = '${ApiUrls.dicount}/$id';

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: await getHeaders(),
      );

      // Handle response status codes
      switch (response.statusCode) {
        case 200:
          print('Discount deleted successfully');
          return;
        case 400:
          throw BadRequestException(
              'Bad Request: Invalid ID provided for deletion.');
        case 401:
          throw UnauthorizedException(
              'Unauthorized: Invalid or missing token.');
        case 403:
          throw ForbiddenException(
              'Forbidden: You do not have permission to delete this category.');
        case 404:
          throw NotFoundException('Not Found: The category does not exist.');
        case 500:
        case 502:
        case 503:
        case 504:
          throw InternalServerException(
              'Server Error: Something went wrong on the server side.');
        default:
          throw UnknownException(
              'Unknown Error: Deletion failed with status code ${response.statusCode}.');
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
