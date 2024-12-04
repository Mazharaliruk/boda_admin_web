
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_urls.dart';
import '../../models/categories_model.dart';
import '../../utils/exceptions/common_exception.dart';

class CategoryRepository {

  Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${ApiUrls.accessToken}',
     
    };
  }



// Method to fetch categories
Future<List<CategoriesModel>> fetchCategories() async {
  const String url = ApiUrls.categories;

  try {
    final response = await http.get(Uri.parse(url), headers: getHeaders());

    // Check response status
    switch (response.statusCode) {
      case 200:
        // Parse and validate data
        final data = json.decode(response.body);
        if (data is List) {
          // Ensure all elements in the list are properly typed
          return data.map<CategoriesModel>((item) {
            if (item is Map<String, dynamic>) {
              print(item);
              return CategoriesModel.fromMap(item);
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


// Update category
Future<void> updateCategory(CategoriesModel data) async {
  final url = '${ApiUrls.categories}/${data.id}';

  try {
    final response = await http.put(
      Uri.parse(url),
      headers: getHeaders(),
      body: json.encode(data.toMap()), // Ensure data is serialized correctly
    );

    // Handle response status codes
    switch (response.statusCode) {
      case 200:
        print('Category updated successfully');
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
Future<void> deleteCategory(int id) async {
  final url = '${ApiUrls.categories}/$id';

  try {
    final response = await http.delete(
      Uri.parse(url),
      headers: getHeaders(),
    );

    // Handle response status codes
    switch (response.statusCode) {
      case 200:
        print('Category deleted successfully');
        return;
      case 400:
        throw BadRequestException('Bad Request: Invalid ID provided for deletion.');
      case 401:
        throw UnauthorizedException('Unauthorized: Invalid or missing token.');
      case 403:
        throw ForbiddenException('Forbidden: You do not have permission to delete this category.');
      case 404:
        throw NotFoundException('Not Found: The category does not exist.');
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