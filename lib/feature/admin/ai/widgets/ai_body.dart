import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/ai/widgets/v_ai_chat_widget.dart';
import 'package:admin_boda/feature/admin/ai/widgets/v_reporting_widget.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class AiBody extends ConsumerStatefulWidget {
  const AiBody({super.key});

  @override
  ConsumerState<AiBody> createState() => _CancellationPolicyBodyState();
}

class _CancellationPolicyBodyState extends ConsumerState<AiBody> {
  List<String> tabs = [
    'Reporting',
    'Marketing Tool',
    'Search Ranking',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ai Analysis',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size22),
            ),
            padding12,
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: context.whiteColor),
              padding:
                  EdgeInsets.symmetric(horizontal: AppConstants.padding + 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  padding20,
                  const VAiChatWidget(),
                  padding12,
                  ButtonsTabBar(
                    borderWidth: 1,
                    height: 50,
                    buttonMargin: const EdgeInsets.all(5),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    radius: 100,
                    backgroundColor: context.primary,
                    unselectedBorderColor: context.textFieldColor,
                    borderColor: context.primary,
                    unselectedDecoration: BoxDecoration(
                      color: context.textFieldColor,
                      border: Border.all(color: context.textFieldColor),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    unselectedLabelStyle: getSemiBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size15),
                    labelStyle: getBoldStyle(
                        color: context.whiteColor, fontSize: MyFonts.size15),
                    tabs: tabs.map((e) => Tab(text: e)).toList(),
                  ),
                  padding12,
                  SizedBox(
                    height: 380,
                    child: TabBarView(
                      children:
                          tabs.map((e) => const VReportingWidget()).toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
