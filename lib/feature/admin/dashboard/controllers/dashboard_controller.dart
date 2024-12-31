

import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';

import '../../../../data/repositories/account/user_repository.dart';
import '../../../../data/repositories/account/vendor_repository.dart';
import '../../../../data/repositories/sales/order_repository.dart';
import '../../../../models/account/user_profile_model.dart';
import '../../../../models/account/vendor_profile_model.dart';
import '../../../../models/sales/order_model.dart';

final dashboardProvider = ChangeNotifierProvider((ref) => DashboardController());

class DashboardController extends ChangeNotifier {
  final _userRepo = UserRepository();
  final _vendorRepo = VendorRepository();
  final _orderRepo = OrderRepository();

  // fetch User

  Future<UserProfileModel> fetchByUser(int id) async {
    return await _userRepo.fetchByUser(id);
  }


  Future<List<OrderModel>> fetchOrders() async {
    return await _orderRepo.fetchOrders();
  }


  Future<List<UserProfileModel>> fetchUserList() async => await _userRepo.fetchUserList();


 Future <List<VendorProfileModel>> fetchVendorList() async => await _vendorRepo.fetchVendorList();

}
