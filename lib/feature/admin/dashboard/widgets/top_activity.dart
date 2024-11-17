import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/top_activity_chart.dart';

class TopActivity extends StatelessWidget {
  const TopActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 395,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.whiteColor,
      ),
      padding: const EdgeInsets.all(10),
      child: const TopActivityChart(),
    );
  }
}
