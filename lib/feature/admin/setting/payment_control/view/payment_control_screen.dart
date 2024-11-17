import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/setting/payment_control/widgets/payment_control_body.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';

class PaymentControlScreen extends StatelessWidget {
  const PaymentControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: const PaymentControlBody(),
      ),
    );
  }
}
