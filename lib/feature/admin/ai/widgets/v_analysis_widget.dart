import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/ai/widgets/v_analysis_pie_chart.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

class VAnalysisWidget extends StatelessWidget {
  const VAnalysisWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(AppConstants.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.blackColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.storeSvgIcon,
                      width: 18.w, height: 18.h),
                  padding8,
                  Text(
                    'Competitor Analysis',
                    style: getRegularStyle(
                        color: context.blackColor, fontSize: MyFonts.size15),
                  ),
                  padding8,
                  SvgPicture.asset(AppAssets.infoSvgIcon,
                      width: 15.w, height: 15.h),
                ],
              ),
           
            ],
          ),
          padding24,
          Row(
            children: [
              const Expanded(
                child: VAnalysisPieChartWidget(),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  status(
                      context: context,
                      title: 'Competitor 1',
                      value: '54,071 ',
                      color: context.errorColor),
                  padding16,
                  status(
                      context: context,
                      title: 'Competitor 2',
                      value: '54,071 ',
                      color: MyColors.platinum),
                  padding16,
                  status(
                      context: context,
                      title: 'Competitor 3',
                      value: '54,071 ',
                      color: MyColors.secondaryColor),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }

  status({
    required BuildContext context,
    required String title,
    required String value,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 6.h,
              width: 3.w,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            padding4,
            Text(
              title,
              style: getRegularStyle(
                  color: context.bodyTextColor, fontSize: MyFonts.size15),
            ),
          ],
        ),
        padding8,
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: value,
                style: getRegularStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size18),
              ),
              TextSpan(
                text: 'sales',
                style: getRegularStyle(
                    color: context.blackColor, fontSize: MyFonts.size9),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
