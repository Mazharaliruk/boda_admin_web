

import 'package:admin_boda/data/repositories/account/vendor_repository.dart';

import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../../../data/repositories/account/user_repository.dart';
import '../../../../../data/repositories/sales/order_repository.dart';
import '../../../../../models/account/vendor_profile_model.dart';
import '../../../../../models/sales/order_model.dart';
final vendorController = ChangeNotifierProvider((ref) => VendorController());
class VendorController  extends ChangeNotifier{
  final _userRepository = UserRepository();
final _vendorRep = VendorRepository();
final _orderRepo = OrderRepository();





/*************  ✨ Codeium Command ⭐  *************/
  /// Fetches a list of all vendors
  ///
  /// Returns a list of [VendorProfileModel] of all vendors
  Future<List<VendorProfileModel>> fetchVendorList() async {
    return await _vendorRep.fetchVendorList();
  }

  // delete user
/*************  ✨ Codeium Command ⭐  *************/
  /// Deletes a vendor by their user ID
  ///
  /// [id] the ID of the user to be deleted
  ///
  /// This method deletes the vendor associated with the given user ID.

  Future<void> deleteVendor(int id) async {
    await _userRepository.deleteUser(id);
  }

  // fetch orders by vendor id
/*************  ✨ Codeium Command ⭐  *************/
  /// Fetches a list of orders by vendor id
  ///
  /// [vendorId] the id of the vendor
  ///
  /// Returns a list of [OrderModel] of the orders that belong to the vendor
  ///
  Future<List<OrderModel>> fetchOrdersByVendorId(int vendorId) async {
    return await _orderRepo.fetchOrdersByVendorId(vendorId);
  }


  // fetch orders by vendor and status
/*************  ✨ Codeium Command ⭐  *************/
  /// Fetches a list of orders by vendor id and status
  ///
  /// [vendorId] the id of the vendor
  ///
  /// [status] the status of the orders
  ///
  /// Returns a list of [OrderModel] of the orders that belong to the vendor and have the given status
  ///
  Future<List<OrderModel>> fetchOrdersByVendordAndStatus(int vendorId, String status) async {
    return await _orderRepo.fetchOrdersByVendordAndStatus(vendorId, status);
  }

}