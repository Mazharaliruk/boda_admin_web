class ApiUrls{
  static const String accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMzNDYzMjI5LCJpYXQiOjE3MzM0NTk2MjksImp0aSI6ImY3MTg5N2RjYzczNDQ5ZDI5NWUxMDgzOWM5ZGViMzdiIiwidXNlcl9pZCI6Mn0.vAEZal-M-KkDCVxjG81Uyy7nj8ZS-nqyufgQdjJEnjg";
  static const String baseUrl = "http://127.0.0.1:8000/";


  // user endpoints
  static const String login = "${baseUrl}api/user/login";
  static const String register = "${baseUrl}api/user/register";

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
  static const String notifications = "${core}notifications/";
  static const String aiRecommendation = "${core}AIRecommendation/";
  static const String chatroom = "${core}chatrooms/";
  static const String messages = "${core}messages/";

}