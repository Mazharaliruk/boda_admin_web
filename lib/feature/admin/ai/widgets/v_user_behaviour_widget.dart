import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

class VUserBehaviourWidget extends StatelessWidget {
  const VUserBehaviourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
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
                  SvgPicture.asset(AppAssets.gameSvgIcon,
                      width: 18.w, height: 18.h),
                  padding8,
                  Text(
                    'User Behaviour',
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
              status(context: context),
              padding16,
              status(context: context),
              padding16,
              status(context: context),
            ],
          ),
          padding18,
          valueIndicator(context: context, value: 100),
          padding12,
          valueIndicator(context: context, value: 200),
          padding12,
          valueIndicator(context: context, value: 300),
          padding16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0',
                style: getRegularStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size11),
              ),
              Text(
                '20k',
                style: getRegularStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size11),
              ),
              Text(
                '40k',
                style: getRegularStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size11),
              ),
              Text(
                '60k',
                style: getRegularStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size11),
              ),
              Text(
                '80k',
                style: getRegularStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size11),
              ),
              Text(
                '100k',
                style: getRegularStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  valueIndicator({
    required BuildContext context,
    required double value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: getRegularStyle(
              color: context.bodyTextColor, fontSize: MyFonts.size11),
        ),
        Container(
          height: 17.h,
          width: value,
          decoration: BoxDecoration(
            color: context.primary,
            borderRadius: BorderRadius.circular(2.r),
          ),
        )
      ],
    );
  }

  status({
    required BuildContext context,
  }) {
    return Column(
      children: [
        Text(
          'Category',
          style: getRegularStyle(
              color: context.bodyTextColor, fontSize: MyFonts.size15),
        ),
        padding8,
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '420',
                style: getRegularStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size24),
              ),
              TextSpan(
                text: 'users',
                style: getRegularStyle(
                    color: context.blackColor, fontSize: MyFonts.size15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
