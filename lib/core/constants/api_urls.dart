class ApiUrls{
  static const String baseUrl = "http://127.0.0.1:8000/";


  // user endpoints
  static const String login = "${baseUrl}api/user/login";
  static const String register = "${baseUrl}api/user/register";

  // Inventry endpoints
  static const String inventry = "${baseUrl}inventry/v1/";
  static const String categories = "$baseUrl${inventry}categories/";
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