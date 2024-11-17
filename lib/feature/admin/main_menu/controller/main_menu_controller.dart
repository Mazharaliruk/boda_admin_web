import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/activities/category_management/view/category_management_screen.dart';
import 'package:admin_boda/feature/admin/activities/event_management/view/event_management_screen.dart';
import 'package:admin_boda/feature/admin/activities/booking_management/view/booking_management_screen.dart';
import 'package:admin_boda/feature/admin/activities/sub_category_management/view/sub_category_management_screen.dart';
import 'package:admin_boda/feature/admin/activities/rating_management/view/rating_comment_screen.dart';
import 'package:admin_boda/feature/admin/ai/view/ai_screen.dart';
import 'package:admin_boda/feature/admin/cancellation_policy/view/cancellation_policy_screen.dart';
import 'package:admin_boda/feature/admin/promotion/discount_management/view/discount_management_screen.dart';
import 'package:admin_boda/feature/admin/promotion/banner_management/view/banner_management_screen.dart';
// import 'package:admin_boda/feature/admin/coupon/user_promotion/view/user_promotion_screen.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/dashboard_body.dart';
import 'package:admin_boda/feature/admin/messages/view/messages_screen.dart';
import 'package:admin_boda/feature/admin/setting/help_center/view/help_center_screen.dart';
// import 'package:admin_boda/feature/admin/messages/view/messages_screen.dart';
import 'package:admin_boda/feature/admin/payment/view/payment_screen.dart';
import 'package:admin_boda/feature/admin/people/users/view/user_screen.dart';
import 'package:admin_boda/feature/admin/people/vendors/view/cash_commission_screen.dart';
import 'package:admin_boda/feature/admin/people/vendors/view/vendors_screen.dart';
import 'package:admin_boda/feature/admin/setting/send_notification/view/send_notification_screen.dart';
import 'package:admin_boda/feature/admin/setting/payment_control/view/payment_control_screen.dart';
import 'package:admin_boda/feature/admin/setting/tax_charges/view/tax_charges_screen.dart';

import '../../../../../commons/common_imports/apis_commons.dart';

final mainMenuProvider = ChangeNotifierProvider((ref) => MainMenuController());

class MainMenuController extends ChangeNotifier {
  List<Widget> screens = [
    const DashboardBody(),
    const PaymentScreen(),
    Container(),
    Container(),
    Container(),
    const TaxChargesScreen(),
    Container(),
    const MessagesScreen(),
    const AIScreen(),
    const HelpCenterScreen(),
    const SendNotificationScreen(),
    const CancellationPolicyaScreen()
  ];

  int _otherScreenIndex = 0;

  int get otherScreenIndex => _otherScreenIndex;

  bool _isOtherScreen = false;

  String _title = 'Dashboard';

  String get title => _title;

  bool get isOtherScreen => _isOtherScreen;

  void setOtherScreen(int index) {
    _otherScreenIndex = index;
    notifyListeners();
  }

  void setTogelOtherScreen(bool value, String title) {
    _isOtherScreen = value;
    _title = title;
    notifyListeners();
  }

  List<Widget> activityScreen = [
    const BookingManagementScreen(),
    const EventManagementScreen(),
    const CategoryManagementScreen(),
    const SubCategoryManagementScreen(),
    const RatingAndCommentScreen(),
  ];
  List<String> activityScreenTitle = [
    'Booking Management',
    'Event Management',
    'Category Management',
    'Sub Category Management',
    'Rating & Comments'
  ];

  List<Widget> settingsScreen = [
    const PaymentControlScreen(),
    const TaxChargesScreen(),
    const SendNotificationScreen(),
    const HelpCenterScreen(),
  ];
  List<String> settingsScreenTitle = [
    'Payment Control',
    'Tax And Charges',
    'Send Notification',
    'FAQs Management ',
  ];

  List<Widget> peopleScreen = const [UserScreen(), VendorsScreen()];
  List<String> peopleScreenTitle = ['User Management', 'Vendor Management'];

  List<Widget> couponScreen = [
    // const CouponManagementScreen(),
    // const CoinManagementScreen(),
    const BannerManagementScreen(),
    const DiscountManagementScreen(),
    // const UserPromotionScreen(),
  ];

  List<String> couponScreenTitle = [
    // 'Coupon Management',
    // 'Coin Management',
    'Banner Management ',
    'Discount Management',
    // 'User Promotion',
  ];

  Widget viewDetailScreen = const CashCommissionScreen();

  bool _viewDetail = false;
  bool get viewDetail => _viewDetail;

  void setViewDetail(bool value) {
    _viewDetail = value;
    notifyListeners();
  }

  List<Widget> _otherScreen = [];
  List<Widget> get otherScreen => _otherScreen;

  List<String> _otherScreenTitle = [];
  List<String> get otherScreenTitle => _otherScreenTitle;

  void setOtherScreenContent(List<Widget> screen, List<String> title) {
    _otherScreen = screen;
    _otherScreenTitle = title;
    notifyListeners();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  int _index = 0;
  int get index => _index;
  setIndex(int id) {
    _index = id;
    notifyListeners();
  }
}
