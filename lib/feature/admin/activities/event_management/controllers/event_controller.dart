import 'package:admin_boda/data/repositories/sales/order_repository.dart';
import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../../../data/repositories/account/user_repository.dart';
import '../../../../../data/repositories/core/event_repository.dart';
import '../../../../../data/repositories/core/reviews_repository.dart';
import '../../../../../models/account/user_profile_model.dart';
import '../../../../../models/core/event_model.dart';
import '../../../../../models/core/reviews_model.dart';
import '../../../../../models/sales/order_model.dart';

final eventProvider = ChangeNotifierProvider((ref) => EventController());

class EventController extends ChangeNotifier {
  final _orderRepo = OrderRepository();
  final _userRepo = UserRepository();
  final _eventRepo = EventRepository();
  final _reviewsRepo = ReviewsRepository();

  Future<List<OrderModel>> fetchOrders() async {
    return await _orderRepo.fetchOrders();
  }

  // fetch order by id
  Future<OrderModel> fetchOrderById(int id) async {
    return await _orderRepo.fetchOrderById(id);
  }

  // fetch orders by event id
  Future<List<OrderModel>> fetchOrdersByEventId(int eventId) async {
    return await _orderRepo.fetchOrdersByEventId(eventId);
  }

  // fetch order by event and status
  Future<List<OrderModel>> fetchOrdersByEventIdAndStatus(
      int eventId, String status) async {
    return await _orderRepo.fetchOrdersByEventIdAndStatus(eventId, status);
  }

  // fetch User
  Future<UserProfileModel> fetchUser(int id) async {
    return await _userRepo.fetchUser(id);
  }

// fetch event by id
  Future<EventModel> fetchEventById(int id) async {
    return await _eventRepo.fetchEventById(id);
  }

  // fetch all events
  Future<List<EventModel>> fetchAllEvents() async {
    return await _eventRepo.fetchEvents();
  }

  // fetch reviews

  Future<List<ReviewsModel>> fetchReviews() async {
    return await _reviewsRepo.fetchReviews();
  }

  // fetch reviews by id

  Future<ReviewsModel> fetchReviewById(int id) async {
    return await _reviewsRepo.fetchReviewById(id);
  }

  // fetch reviews by event id
  Future<List<ReviewsModel>> fetchReviewByEvent(int eventId) async {
    return await _reviewsRepo.fetchReviewByEvent(eventId);
  }
}
