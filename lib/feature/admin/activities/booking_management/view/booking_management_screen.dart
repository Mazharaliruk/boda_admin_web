import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/activities/booking_management/widgets/booking_body.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';

class BookingManagementScreen extends StatelessWidget {
  const BookingManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: const BookingBody(),
      ),
    );
  }
}
