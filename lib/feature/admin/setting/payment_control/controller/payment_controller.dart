import 'package:admin_boda/data/repositories/sales/order_repository.dart';
import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';

import '../../../../../data/repositories/account/user_repository.dart';
import '../../../../../data/repositories/core/event_repository.dart';
import '../../../../../data/repositories/sales/payment_repository.dart';
import '../../../../../models/account/user_profile_model.dart';
import '../../../../../models/core/event_model.dart';
import '../../../../../models/sales/order_model.dart';
import '../../../../../models/sales/payment_model.dart';

final paymentProviderController =
    ChangeNotifierProvider((ref) => PaymentSettingController());

class PaymentSettingController extends ChangeNotifier {
  final _orderRepo = OrderRepository();
  final _paymentRepo = PaymentRepository();
  final _userRepo = UserRepository();
  final _eventRepo = EventRepository();

  Future<List<OrderModel>> fetchOrders() async {
    return await _orderRepo.fetchOrders();
  }

  // fetch payments
  Future<List<PaymentModel>> fetchPayment() async {
    return await _paymentRepo.fetchPayment();
  }

  // fetch order by id // fetch order by id
  Future<OrderModel> fetchOrderById(int id) async {
    return await _orderRepo.fetchOrderById(id);
  }

  // fetch User
  Future<UserProfileModel> fetchUser(int id) async {
    return await _userRepo.fetchUser(id);
  }

  // fetch event by id
  Future<EventModel> fetchEventById(int id) async {
    return await _eventRepo.fetchEventById(id);
  }
}
