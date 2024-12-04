class ApiUrls{
  static const String accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMzMjk1MTg0LCJpYXQiOjE3MzMyOTM5ODQsImp0aSI6IjM2ZTUzNmUwM2Q2YzRhZWI4NzM5ZjcyYWFlZDQzNjUwIiwidXNlcl9pZCI6Mn0.8Bk_gHfPHaog-MNgLtHhSfhb7AjtTS3RPKgcT0y65aY";
  static const String baseUrl = "http://127.0.0.1:8000/";


  // user endpoints
  static const String login = "${baseUrl}api/user/login";
  static const String register = "${baseUrl}api/user/register";

  // Inventry endpoints
  static const String inventry = "${baseUrl}inventry/v1/";
  static const String categories = "${inventry}categories/";
  static const String subCategories = "$baseUrl${inventry}subcategories/";
  static const String promotion = "$baseUrl${inventry}promotions/";
  static const String dicount = "$baseUrl${inventry}discounts/";
  static const String taxe = "$baseUrl${inventry}taxes/";

  // sales endpoints
  static const String sales = "${baseUrl}sales/v1/";
  static const String salesOrder = "$baseUrl${sales}orders/";
  static const String transaction = "$baseUrl${sales}transactions/";
  static const String payment = "$baseUrl${sales}payments/";
  static const String paymentGetway = "$baseUrl${sales}paymentgetways/";

  //core endpoints
  static const String core = "${baseUrl}core/v1/";
  static const String businessType = "$baseUrl${core}businesstypes/";
  static const String business = "$baseUrl${core}businesses/";
  static const String event = "$baseUrl${core}events/";
  static const String services = "$baseUrl${core}services/";
  static const String eventServices = "$baseUrl${core}eventservices/";
  static const String eventmedia = "$baseUrl${core}eventmedia/";
  static const String reviews = "$baseUrl${core}reviews/";
  static const String notifications = "$baseUrl${core}notifications/";
  static const String aiRecommendation = "$baseUrl${core}AIRecommendation/";
  static const String chatroom = "$baseUrl${core}chatrooms/";
  static const String messages = "$baseUrl${core}messages/";

}