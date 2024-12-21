

import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../../../data/repositories/account/user_repository.dart';
import '../../../../../models/account/user_profile_model.dart';
final customerProvider = ChangeNotifierProvider((ref) => CustomerController());
class CustomerController  extends ChangeNotifier{
  
final _userRepository = UserRepository();





  Future<List<UserProfileModel>> fetchUserList() async {
    return await _userRepository.fetchUserList();
  }

}