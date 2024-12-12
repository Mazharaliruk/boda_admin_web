import 'package:admin_boda/core/constants/api_urls.dart';
import 'package:flutter/material.dart';
import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../data/repositories/auth/auth_repo.dart';
import '../../../models/account/admin_profile.dart';
import '../../admin/main_menu/controller/main_menu_controller.dart';

// The ChangeNotifierProvider should watch the AuthController
final authContoller = ChangeNotifierProvider<AuthController>((ref) => AuthController(ref));
final mainMenuProvider = ChangeNotifierProvider((ref) => MainMenuController());

class AuthController extends ChangeNotifier {
  final Ref ref;
  final _authRepo = AuthRepo();
  

  AuthController(this.ref);
    // Call MainMenuController
MainMenuController get mainMenuController => ref.read(mainMenuProvider);
  // Fetch the admin profile
  Future<AdminProfile> fetchAdminProfile() async {
    return await _authRepo.fetchAdminProfile();
  }

  // Handle login
  Future<void> login(String email, String password, BuildContext context) async {
    await _authRepo.login(email, password, context);
    notifyListeners(); // Notify listeners on login success
  }

  // Handle logout
  Future<void> logout() async {
    await _authRepo.logout(await ApiUrls.getrefreshToken()??"");
     mainMenuController.setIndex(0);
    mainMenuController.setTogelOtherScreen(false, 'Login');
    notifyListeners(); 
  }

  // Check if the user is logged in
  Future<bool> isLoggedIn() async => await _authRepo.isLoggedIn();
}
