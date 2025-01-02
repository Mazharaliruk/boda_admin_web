import 'dart:convert';

import '../../../core/constants/api_urls.dart';
import '../../../models/inventry/tax_model.dart';
import '../../../utils/exceptions/common_exception.dart';
import 'category_repository.dart';
import 'package:http/http.dart' as http;

class TaxRepository {
   
Future<List<TaxModel>> fetchTax() async {
  const String url = ApiUrls.taxe;

  try {
    final response = await http.get(Uri.parse(url), headers:await getHeaders());

    // Check response status
    switch (response.statusCode) {
      case 200:
        // Parse and validate data
        final data = json.decode(response.body);
        if (data is List) {
          // Ensure all elements in the list are properly typed
          return data.map<TaxModel>((item) {
            if (item is Map<String, dynamic>) {
              return TaxModel.fromMap(item);
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


// add tax

Future<void> addTax(Map<String, dynamic> data) async {
  const url = ApiUrls.taxe;
  print(url);

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: await getHeaders(),
      body: json.encode(data),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // Handle response status codes
    switch (response.statusCode) {
      case 200:
      case 201: // Added case for 201
        print('Tax added successfully');
        return;
      case 400:
        throw BadRequestException('Bad Request: Invalid data for update.');
      case 401:
        throw UnauthorizedException('Unauthorized: Invalid or missing token.');
      case 403:
        throw ForbiddenException('Forbidden: You do not have permission to update this category.');
      case 404:
        throw NotFoundException('Not Found: The category does not exist.');
      case 500:
      case 502:
      case 503:
      case 504:
        throw InternalServerException('Server Error: Something went wrong on the server side.');
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



// Fetch a single tax by ID
Future<TaxModel?> fetchTaxById(int taxId) async {
  final url = '${ApiUrls.taxe}$taxId/'; // Adjusted endpoint for fetching by ID
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
        return TaxModel.fromMap(data); // Convert JSON to TaxModel
      case 400:
        throw BadRequestException('Bad Request: Invalid data for fetching.');
      case 401:
        throw UnauthorizedException('Unauthorized: Invalid or missing token.');
      case 403:
        throw ForbiddenException('Forbidden: You do not have permission to view this tax.');
      case 404:
        throw NotFoundException('Not Found: The requested tax does not exist.');
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
Future<void> updateTax(TaxModel data) async {
  final url = '${ApiUrls.taxe}${data.id}/';

  try {
    final response = await http.put(
      Uri.parse(url),
      headers:await getHeaders(),
      body: json.encode(data.toMap()), // Ensure data is serialized correctly
    );

    // Handle response status codes
    switch (response.statusCode) {
      case 200:
        print('Tax updated successfully');
        return;
      case 400:
        throw BadRequestException('Bad Request: Invalid data for update.');
      case 401:
        throw UnauthorizedException('Unauthorized: Invalid or missing token.');
      case 403:
        throw ForbiddenException('Forbidden: You do not have permission to update this category.');
      case 404:
        throw NotFoundException('Not Found: The category does not exist.');
      case 500:
      case 502:
      case 503:
      case 504:
        throw InternalServerException('Server Error: Something went wrong on the server side.');
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
Future<void> deleteTax(int id) async {
  final url = '${ApiUrls.taxe}$id/';

  print(url);
  try {
    final response = await http.delete(
      Uri.parse(url),
      headers: await getHeaders(),
    );

    print('Response status: ${response.statusCode}');

    // Handle response status codes
    switch (response.statusCode) {
      case 200:
      case 204: // Added case for 204
        print('Tax deleted successfully');
        return;
      case 400:
        throw BadRequestException('Bad Request: Invalid ID provided for deletion.');
      case 401:
        throw UnauthorizedException('Unauthorized: Invalid or missing token.');
      case 403:
        throw ForbiddenException('Forbidden: You do not have permission to delete this category.');
      case 404:
        throw NotFoundException('Not Found: The tax does not exist.');
      case 500:
      case 502:
      case 503:
      case 504:
        throw InternalServerException('Server Error: Something went wrong on the server side.');
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