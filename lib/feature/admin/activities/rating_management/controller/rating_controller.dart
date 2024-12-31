import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';

import '../../../../../data/repositories/account/user_repository.dart';
import '../../../../../data/repositories/core/reviews_repository.dart';
import '../../../../../models/account/user_profile_model.dart';
import '../../../../../models/core/reviews_model.dart';

final ratingProvider = ChangeNotifierProvider((ref) => RatingController());

class RatingController extends ChangeNotifier {
  final _userRepo = UserRepository();
  final _reviewsRepo = ReviewsRepository();

  // fetch User

  Future<UserProfileModel> fetchByUser(int id) async {
    return await _userRepo.fetchByUser(id);
  }

  // fetch reviews

  Future<List<ReviewsModel>> fetchReviews() async {
    return await _reviewsRepo.fetchReviews();
  }
}
