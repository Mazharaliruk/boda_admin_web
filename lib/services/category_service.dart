import 'dart:async';
import '../core/constants/api_urls.dart';
import '../models/inventry/categories_model.dart';
import '../utils/helpers/boda_streaming_helper.dart';

class CategoryService {
 

  // Initialize the WebSocket connection and potentially use the access token
  Future<void> init() async {
    try{
  String? accessToken = await ApiUrls.getAccessToken();
    if (accessToken == null) return;
    }catch(e){
      print('Error getting access token: $e');
    }   
  }

  // Stream that listens for category updates
  Stream<List<CategoriesModel>> listenForCategoryUpdates() {
   
    final bodaStreamingHelper = BodaStreamingHelper(ApiUrls.wsCategories);
    final StreamController<List<CategoriesModel>> controller =
        StreamController<List<CategoriesModel>>.broadcast();
    List<CategoriesModel> categoriesList = [];

    // Listen to WebSocket stream for category updates
    bodaStreamingHelper.stream.listen(
      (event) {
        final action = event['action'];
        final categoryData = event['category'];

        // Handle the incoming data based on action type
        if (action == 'create' || action == 'update') {
          final category = CategoriesModel.fromMap(categoryData);
          // If it's a create or update, add or update the category in the list
          if (action == 'create') {
            categoriesList.add(category);
          } else if (action == 'update') {
            int index = categoriesList.indexWhere((cat) => cat.id == category.id);
            if (index != -1) {
              categoriesList[index] = category;
            }
          }
        } else if (action == 'delete') {
          // Handle category deletion
          final categoryId = categoryData['id'];
          categoriesList.removeWhere((cat) => cat.id == categoryId);
        }

        // Add the updated list to the stream
        controller.add(List.from(categoriesList));
      },
      onError: (error) {
        controller.addError(error);
      },
      onDone: () {
        controller.close();
      },
    );

    // Return the stream of category updates
    return controller.stream;
  }
}
