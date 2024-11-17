import 'package:admin_boda/feature/admin/ai/widgets/v_analysis_widget.dart';
import 'package:admin_boda/feature/admin/ai/widgets/v_sale_widget.dart';
import 'package:admin_boda/feature/admin/ai/widgets/v_user_behaviour_widget.dart';
import 'package:flutter/widgets.dart';

class VReportingWidget extends StatelessWidget {
  const VReportingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          VUserBehaviourWidget(),
          VSaleWidget(),
          VAnalysisWidget(),
        ],
      ),
    );
  }
}
