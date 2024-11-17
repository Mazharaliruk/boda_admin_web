import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/activities/sub_category_management/widgets/sub_category_body.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';

class SubCategoryManagementScreen extends StatelessWidget {
  const SubCategoryManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: const SubCategoryBody(),
      ),
    );
  }
}
