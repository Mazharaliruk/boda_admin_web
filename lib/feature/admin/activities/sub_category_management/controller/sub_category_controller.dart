import 'dart:io';

import 'package:admin_boda/data/repositories/inventry/sub_category_repository.dart';
import 'package:admin_boda/models/inventry/sub_category_model.dart';

import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';

final subCategoryManagementProvider = ChangeNotifierProvider((ref) => SubCategoryController());
class SubCategoryController extends ChangeNotifier {
final _categoryRepo = SubCategoryRepository();

  var selectedSubCategory;







/*************  ✨ Codeium Command ⭐  *************/
  /// Fetches the list of categories from the server
  ///
  /// Returns a list of [CategoriesModel] if the request is successful.
  /// Throws an [Exception] if any error occurs.
  // fetch categories
  Future<List<SubCategoryModel>> fetchSubCategories() async {
    return await _categoryRepo.fetchSubCategories();
  }

// update category
  Future<void> updateSubCategory(SubCategoryModel data) async {
     await _categoryRepo.updateSubCategory(data);
  }


/*************  ✨ Codeium Command ⭐  *************/
  /// Saves a new category to the server.
  ///
  /// Accepts a [Map<String, dynamic>] of the category data. The map should contain the following keys:
  ///
  /// * `name`: The name of the category.
  /// * `slug`: The slug of the category.
  /// * `is_active`: The status of the category (true or false).
  ///
  /// Optional [File] parameter, `imageFile`, can be used to upload a category image.
  ///
  Future<void> saveSubCategory(Map<String, dynamic> data, [File? imageFile])async{
    _categoryRepo.saveSubCategory(data, imageFile);
  }
}