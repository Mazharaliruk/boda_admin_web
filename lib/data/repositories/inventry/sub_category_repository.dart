import 'dart:convert';
import 'dart:io';

import '../../../core/constants/api_urls.dart';
import '../../../models/inventry/sub_category_model.dart';
import '../../../utils/exceptions/common_exception.dart';
import 'category_repository.dart';
import 'package:http/http.dart' as http;

class SubCategoryRepository {
  
Future<List<SubCategoryModel>> fetchSubCategories() async {
  const String url = ApiUrls.subCategories;

  try {
    final response = await http.get(Uri.parse(url), headers:await getHeaders());

    // Check response status
    switch (response.statusCode) {
      case 200:
        // Parse and validate data
        final data = json.decode(response.body);
        if (data is List) {
          // Ensure all elements in the list are properly typed
          return data.map<SubCategoryModel>((item) {
            if (item is Map<String, dynamic>) {
              print(item);
              return SubCategoryModel.fromMap(item);
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




Future<void> saveSubCategory(Map<String, dynamic> data, [File? imageFile]) async {
  const url = ApiUrls.subCategories;

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
          'image_url', // Match the Django model field name
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
        print('Category saved successfully');
        return;
      case 400:
        throw BadRequestException('Bad Request: Invalid data for save.');
      case 401:
        throw UnauthorizedException('Unauthorized: Invalid or missing token.');
      case 403:
        throw ForbiddenException(
            'Forbidden: You do not have permission to save this category.');
      case 404:
        throw NotFoundException('Not Found: The category does not exist.');
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


// Update category
Future<void> updateSubCategory(SubCategoryModel data) async {
  final url = '${ApiUrls.subCategories}/${data.id}';

  try {
    final response = await http.put(
      Uri.parse(url),
      headers:await getHeaders(),
      body: json.encode(data.toMap()), // Ensure data is serialized correctly
    );

    // Handle response status codes
    switch (response.statusCode) {
      case 200:
        print('Sub Category updated successfully');
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
Future<void> deleteSubCategory(int id) async {
  final url = '${ApiUrls.subCategories}/$id';

  try {
    final response = await http.delete(
      Uri.parse(url),
      headers:await getHeaders(),
    );

    // Handle response status codes
    switch (response.statusCode) {
      case 200:
        print('Sub Category deleted successfully');
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