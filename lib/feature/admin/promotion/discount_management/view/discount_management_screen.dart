import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/promotion/discount_management/widgets/discount_body.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';

class DiscountManagementScreen extends StatelessWidget {
  const DiscountManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: const DiscountBody(),
      ),
    );
  }
}
