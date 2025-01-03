
import 'dart:convert';
import 'package:admin_boda/models/core/event_model.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/api_urls.dart';
import '../../../utils/exceptions/common_exception.dart';
import '../inventry/category_repository.dart';

class EventRepository {


// Method to fetch Orders
Future<List<EventModel>> fetchEvents() async {
  const String url = ApiUrls.event;

  try {
    final response = await http.get(Uri.parse(url), headers:await getHeaders());

    // Check response status
    switch (response.statusCode) {
      case 200:
        // Parse and validate data
        final data = json.decode(response.body);
        if (data is List) {
          // Ensure all elements in the list are properly typed
          return data.map<EventModel>((item) {
            if (item is Map<String, dynamic>) {
              return EventModel.fromMap(item);
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



Future<EventModel> fetchEventById(int id) async {
  final String url = '${ApiUrls.event}$id/';
  print(url);

  try {
    final response = await http.get(Uri.parse(url), headers: await getHeaders());

    // Check response status
    switch (response.statusCode) {
      case 200:
        // Parse and validate data
        final data = json.decode(response.body);
        if (data is Map<String, dynamic>) {
              print("kkkk$data");

          return EventModel.fromMap(data);
        } else {
          throw FormatException("Unexpected data format: ${data.runtimeType}");
        }
      case 400:
        throw BadRequestException('Bad Request: Invalid parameters provided.');
      case 401:
        throw UnauthorizedException('Unauthorized: Invalid or missing token.');
      case 403:
        throw ForbiddenException('Forbidden: Access to the resource is denied.');
      case 404:
        throw NotFoundException('Not Found: The requested event was not found.');
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
    print("ddd$e");
    throw UnknownException('An unexpected error occurred: $e');
  }
}



// Update Order
Future<void> updateEvent(EventModel data) async {
  final url = '${ApiUrls.event}/${data.id}';

  try {
    final response = await http.put(
      Uri.parse(url),
      headers:await getHeaders(),
      body: json.encode(data.toMap()), // Ensure data is serialized correctly
    );

    // Handle response status codes
    switch (response.statusCode) {
      case 200:
        print('Event updated successfully');
        return;
      case 400:
        throw BadRequestException('Bad Request: Invalid data for update.');
      case 401:
        throw UnauthorizedException('Unauthorized: Invalid or missing token.');
      case 403:
        throw ForbiddenException('Forbidden: You do not have permission to update this Orders.');
      case 404:
        throw NotFoundException('Not Found: The Orders does not exist.');
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


// Delete Orders
Future<void> deleteEvent(int id) async {
  final url = '${ApiUrls.event}/$id';

  try {
    final response = await http.delete(
      Uri.parse(url),
      headers:await getHeaders(),
    );

    // Handle response status codes
    switch (response.statusCode) {
      case 200:
        print('Event deleted successfully');
        return;
      case 400:
        throw BadRequestException('Bad Request: Invalid ID provided for deletion.');
      case 401:
        throw UnauthorizedException('Unauthorized: Invalid or missing token.');
      case 403:
        throw ForbiddenException('Forbidden: You do not have permission to delete this Orders.');
      case 404:
        throw NotFoundException('Not Found: The Orders does not exist.');
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