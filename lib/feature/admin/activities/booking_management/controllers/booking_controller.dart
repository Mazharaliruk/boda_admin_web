import 'package:admin_boda/data/repositories/sales/order_repository.dart';
import 'package:admin_boda/data/repositories/sales/transaction_repository.dart';
import 'package:admin_boda/models/sales/transaction_model.dart';
import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../../../data/repositories/account/user_repository.dart';
import '../../../../../data/repositories/core/event_repository.dart';
import '../../../../../data/repositories/core/reviews_repository.dart';
import '../../../../../data/repositories/sales/payment_getway_repository.dart';
import '../../../../../models/account/user_profile_model.dart';
import '../../../../../models/core/event_model.dart';
import '../../../../../models/core/reviews_model.dart';
import '../../../../../models/sales/order_model.dart';
import '../../../../../models/sales/payment_getway_model.dart';

final bookingProvider = ChangeNotifierProvider((ref) => BookingController());

class BookingController extends ChangeNotifier {
  final _orderRepo = OrderRepository();
  final _userRepo = UserRepository();
  final _eventRepo = EventRepository();
  final _reviewsRepo = ReviewsRepository();
  final _transactionRepo = TransactionRepository();
  final _paymentGetwayRepo = PaymentGetwayRepository();

  Future<List<OrderModel>> fetchOrders() async {
    return await _orderRepo.fetchOrders();
  }

  // fetch User

  Future<UserProfileModel> fetchUser(int id) async {
    return await _userRepo.fetchUser(id);
  }

// fetch event by id

  Future<EventModel> fetchEventById(int id) async {
    return await _eventRepo.fetchEventById(id);
  }

  // fetch reviews

  Future<List<ReviewsModel>> fetchReviews() async {
    return await _reviewsRepo.fetchReviews();
  }

  // fetch transactions by order

  Future<TransactionModel?> fetchTransactionsByOrder(int orderId) async {
    return await _transactionRepo.fetchTransactionByOrder(orderId);
  }

  // fetch payment getway by id

  Future<PaymentGetwayModel?> fetchPaymentGetwayById(int id) async {
    return await _paymentGetwayRepo.fetchPaymentGetwayById(id);
  }
}
