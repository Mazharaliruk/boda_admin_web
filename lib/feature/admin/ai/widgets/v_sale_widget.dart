import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/ai/widgets/v_chart.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

class VSaleWidget extends StatelessWidget {
  const VSaleWidget({super.key});

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
                  SvgPicture.asset(AppAssets.chartSvgIcon,
                      width: 18.w, height: 18.h),
                  padding8,
                  Text(
                    'Sales',
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
          Text(
            '\$20,245',
            style: getRegularStyle(
                color: context.blackColor, fontSize: MyFonts.size30),
          ),
          padding8,
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: MyColors.lightGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: MyColors.lightGreen),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: MyColors.lightGreen,
                      size: 15.r,
                    ),
                    padding8,
                    Text(
                      '12%',
                      style: getRegularStyle(
                          color: MyColors.lightGreen, fontSize: MyFonts.size12),
                    )
                  ],
                ),
              ),
              padding12,
              Text(
                'vs last years',
                style: getRegularStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size12),
              ),
            ],
          ),
          padding18,
          const VChart(),
        ],
      ),
    );
  }
}
