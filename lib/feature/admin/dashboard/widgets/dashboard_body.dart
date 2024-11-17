import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/dashboard_detail_body.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/dashboard_notification_body.dart';

class DashboardBody extends ConsumerStatefulWidget {
  const DashboardBody({super.key});

  @override
  ConsumerState<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends ConsumerState<DashboardBody> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 2, child: DashboardDetailBody()),
        padding12,
        const Expanded(flex: 1, child: DashboardNotificationBody())
      ],
    );
  }
}
