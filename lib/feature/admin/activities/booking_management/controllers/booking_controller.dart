


import 'package:admin_boda/data/repositories/sales/order_repository.dart';
import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../../../models/sales/order_model.dart';
final bookingProvider = ChangeNotifierProvider((ref) => BookingController());
class BookingController  extends ChangeNotifier{
  
final _orderRepo = OrderRepository();



  Future<List<OrderModel>> fetchOrders() async {
    return await _orderRepo.fetchOrders();
  }


}