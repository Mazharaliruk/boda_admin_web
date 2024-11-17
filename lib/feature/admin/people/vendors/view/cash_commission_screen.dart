import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/people/vendors/widgets/cash_commission_body.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';

class CashCommissionScreen extends StatelessWidget {
  const CashCommissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: const CashCommissionBody(),
      ),
    );
  }
}
