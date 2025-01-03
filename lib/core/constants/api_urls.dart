import 'package:shared_preferences/shared_preferences.dart';

class ApiUrls {
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();

    final accessToken = prefs.getString('accessToken');
    return accessToken;
  }


    static Future<String?> getrefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    

    final refreshToken = prefs.getString('refreshToken');
    return refreshToken;
  }


 
  static const String baseUrl = "http://127.0.0.1:8000/";

  // user endpoints
  static const String login = "${baseUrl}api/user/login/";
  static const String register = "${baseUrl}api/user/register/";
  static const String logout = "${baseUrl}api/user/logout/";
  static const String profile = "${baseUrl}api/user/profile/";
  static const String userList = "${baseUrl}api/user/list/";
  static const String vendorList = "${baseUrl}api/vendor/list/";
  static const String customer = "${baseUrl}api/customer";
  static const String customerByUser = "${baseUrl}api/customer_by_user";



  // Inventry endpoints
  static const String inventry = "${baseUrl}inventry/v1/";
  static const String categories = "${inventry}categories/";
  static const String subCategories = "${inventry}subcategories/";
  static const String promotion = "${inventry}promotions/";
  static const String dicount = "${inventry}discounts/";
  static const String taxe = "${inventry}taxes/";

  // sales endpoints
  static const String sales = "${baseUrl}sales/v1/";
  static const String salesOrder = "${sales}orders/";
  // order related endpoints
  static const String fetchOrdersByEvent = "${salesOrder}by-event/";
   static const String fetchOrdersByEventAndStatus = "${salesOrder}by-event-status/";
  static const String transaction = "${sales}transactions/";
  static const String payment = "${sales}payments/";
  static const String paymentGetway = "${sales}paymentgetways/";

  //core endpoints
  static const String core = "${baseUrl}core/v1/";
  static const String businessType = "${core}businesstypes/";
  static const String business = "${core}businesses/";
  static const String event = "${core}events/";
  static const String services = "${core}services/";
  static const String eventServices = "${core}eventservices/";
  static const String eventmedia = "${core}eventmedia/";
  static const String reviews = "${core}reviews/";
  // revies endpoints
  static const String reviewsByEvent = "${reviews}by-event/";
  static const String notifications = "${core}notifications/";
  static const String aiRecommendation = "${core}AIRecommendation/";
  static const String chatroom = "${core}chatrooms/";
  static const String messages = "${core}messages/";


}
