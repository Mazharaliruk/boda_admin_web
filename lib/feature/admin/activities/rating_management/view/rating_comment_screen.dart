import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/activities/rating_management/widgets/rating_comment_body.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';

class RatingAndCommentScreen extends StatelessWidget {
  const RatingAndCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: const RatingCommentBody(),
      ),
    );
  }
}
