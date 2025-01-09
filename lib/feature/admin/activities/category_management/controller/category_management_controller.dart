import 'dart:io';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import '../../../../../data/repositories/inventry/category_repository.dart';
import '../../../../../models/inventry/categories_model.dart';
import '../../../../../services/category_service.dart';

final categoryManagementProvider = ChangeNotifierProvider((ref) => CategoryManagementController());

class CategoryManagementController extends ChangeNotifier {
  final _categoryRepo = CategoryRepository();
  final _categoryService = CategoryService();

  // Initialize CategoryService asynchronously
  
  

  @override
  void dispose() {
    // Clean up any resources when the controller is disposed
    super.dispose();
  }

  // Fetch categories
  Future<List<CategoriesModel>> fetchCategories() async {
    return await _categoryRepo.fetchCategories();
  }

  // Update category
  Future<void> updateCategory(CategoriesModel data) async {
    await _categoryRepo.updateCategory(data);
  }

  // Save category
  Future<void> saveCategory(Map<String, dynamic> data, [File? imageFile]) async {
    await _categoryRepo.saveCategory(data, imageFile);
  }

  // Listen for category updates
  Stream<List<CategoriesModel>> listenForCategoryUpdates() {
  
    return _categoryService.listenForCategoryUpdates();
  }
}
