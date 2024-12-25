


import 'package:admin_boda/data/repositories/sales/order_repository.dart';
import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../../../data/repositories/account/user_repository.dart';
import '../../../../../models/account/user_profile_model.dart';
import '../../../../../models/sales/order_model.dart';
final bookingProvider = ChangeNotifierProvider((ref) => BookingController());
class BookingController  extends ChangeNotifier{
  
final _orderRepo = OrderRepository();
final _userRepo = UserRepository();



  Future<List<OrderModel>> fetchOrders() async {
    return await _orderRepo.fetchOrders();
  }

  // fetch User

  Future<UserProfileModel> fetchUser(int id
  ) async {
    return await _userRepo.fetchUser(id);
  }


}