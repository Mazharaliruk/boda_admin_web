import 'package:flutter/material.dart';
import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../data/repositories/auth/auth_repo.dart';
import '../../../models/account/admin_profile.dart';

// The ChangeNotifierProvider should watch the AuthController
final authContoller = ChangeNotifierProvider<AuthController>((ref) => AuthController(ref));

class AuthController extends ChangeNotifier {
  final Ref ref;
  final _authRepo = AuthRepo();

  AuthController(this.ref);

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
    await _authRepo.logout();
    notifyListeners(); // Notify listeners on logout
  }

  // Check if the user is logged in
  Future<bool> isLoggedIn() async => await _authRepo.isLoggedIn();
}
