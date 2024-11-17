import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/main_menu/view/main_menu_screen.dart';

import 'navigation.dart';

class AppRoutes {
  static const String mainMenuScreen = '/mainMenuScreen';

  // User profile Section
  static const String editProfileScreen = '/editProfileScreen';
  static const String changePasswordProfileScreen =
      '/changePasswordProfileScreen';

  // User Notification Section
  static const String userNotificationScreen = '/userNotificationScreen';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainMenuScreen:
        return _buildRoute(const MainMenuScreen());
      // case introductionScreen:
      // Map<String, dynamic> arguments =
      //     settings.arguments as Map<String, dynamic>;
      // return _buildRoute(ChecklistDetailScreen(
      //   checkListModel: arguments['checkListModel'],
      // ));

      default:
        return unDefinedRoute();
    }
  }

  static unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        backgroundColor: Colors.black,
      ),
    );
  }

  static _buildRoute(Widget widget, {int? duration = 400}) {
    return forwardRoute(widget, duration);
  }
}
