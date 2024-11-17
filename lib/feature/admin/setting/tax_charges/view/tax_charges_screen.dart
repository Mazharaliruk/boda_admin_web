import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/setting/tax_charges/widgets/setting_body.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';

class TaxChargesScreen extends StatelessWidget {
  const TaxChargesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: const SettingBody(),
      ),
    );
  }
}
