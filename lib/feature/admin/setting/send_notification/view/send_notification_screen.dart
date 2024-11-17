import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/setting/send_notification/widgets/send_notification_body.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';

class SendNotificationScreen extends StatelessWidget {
  const SendNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: const SendNotificationBody(),
      ),
    );
  }
}
