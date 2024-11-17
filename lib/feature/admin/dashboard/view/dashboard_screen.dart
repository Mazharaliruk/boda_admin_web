import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/dashboard_body.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';

class BashboardScreen extends StatelessWidget {
  const BashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: const DashboardBody(),
      ),
    );
  }
}
