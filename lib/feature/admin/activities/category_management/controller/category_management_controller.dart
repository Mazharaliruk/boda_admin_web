import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';

import '../../../../../data/repositories/category_repository.dart';
import '../../../../../models/inventry/categories_model.dart';


final categoryManagementProvider = ChangeNotifierProvider((ref) => CategoryManagementController());

class CategoryManagementController extends ChangeNotifier{

final _categoryRepo = CategoryRepository();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



  // fetch categories
  Future<List<dynamic>> fetchCategories() async {
    return await _categoryRepo.fetchCategories();
  }

// update category
  Future<void> updateCategory(CategoriesModel data) async {
    return await _categoryRepo.updateCategory(data);
  }
}