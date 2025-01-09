

import 'package:admin_boda/data/repositories/account/vendor_repository.dart';

import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../../../data/repositories/account/user_repository.dart';
import '../../../../../models/account/vendor_profile_model.dart';
final vendorController = ChangeNotifierProvider((ref) => VendorController());
class VendorController  extends ChangeNotifier{
  final _userRepository = UserRepository();
final _vendorRep = VendorRepository();





  Future<List<VendorProfileModel>> fetchVendorList() async {
    return await _vendorRep.fetchVendorList();
  }

  // delete user
  Future<void> deleteVendor(int id) async {
    await _userRepository.deleteUser(id);
  }

}