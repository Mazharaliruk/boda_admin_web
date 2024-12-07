
import 'dart:io';

import 'package:admin_boda/models/inventry/discount_model.dart';

import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../../../data/repositories/inventry/discount_repository.dart';
final discountProvider = ChangeNotifierProvider((ref) => DiscountController());
class DiscountController  extends ChangeNotifier{
  
final _discountRepository = DiscountRepository();




  // fetch categories
/*************  ✨ Codeium Command ⭐  *************/
  /// Fetches the list of all categories from the server
  ///
  /// Returns a list of [CategoriesModel] if the request is successful.
  /// Throws an exception if the request fails.
  
/*************  ✨ Codeium Command ⭐  *************/
  /// Fetches the list of all discounts from the server
  ///
  /// Returns a list of [DiscountModel] if the request is successful.
  /// Throws an exception if the request fails.
  Future<List<DiscountModel>> fetchDiscount() async {
    return await _discountRepository.fetchDiscount();
  }

// update category
/*************  ✨ Codeium Command ⭐  *************/
  /// Updates a discount on the server.
  ///
  /// Throws an exception if the request fails.
  Future<void> updateDiscount(DiscountModel data) async {
     await _discountRepository.updateDiscount(data);
  }


/*************  ✨ Codeium Command ⭐  *************/
  /// Saves a new discount to the server.
  ///
  /// Accepts a [Map<String, dynamic>] of the discount data. The map should contain the following keys:
  ///
  /// * `name`: The name of the discount.
  /// * `vendor_id`: The id of the vendor.
  /// * `promotion`: The id of the promotion.
  /// * `service`: The id of the service.
  /// * `image_url`: The image url of the discount.
  /// * `description`: The description of the discount.
  /// * `is_active`: The status of the discount (true or false).
  /// * `discount_percent`: The discount percentage.
  /// * `start_date`: The start date of the discount.
  /// * `end_date`: The end date of the discount.
  /// Optional [File] parameter, `imageFile`, can be used to upload a discount image.
  ///
  /// Throws an exception if the request fails.
  Future<void> saveDiscount(Map<String, dynamic> data, [File? imageFile])async{
    _discountRepository.saveDiscount(data, imageFile);
  }
}