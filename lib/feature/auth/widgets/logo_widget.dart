import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 60.w),
        width: 663.w,
        decoration: BoxDecoration(
          gradient: context.primaryGradient,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(AppAssets.appLogo, width: 50.w, height: 50.h),
                padding12,
                Text(
                  'BODA',
                  style: getBoldStyle(
                    color: context.whiteColor,
                    fontSize: MyFonts.size30,
                  ),
                ),
              ],
            ),
            padding56,
            Text(
              'Your place to work\nPlan. Create. Control.',
              style: getBoldStyle(
                color: context.whiteColor,
                fontSize: MyFonts.size40,
              ),
            ),
            padding40,
            Center(
              child: Image.asset(
                AppAssets.loginImage,
                width: 500.w,
                height: 500.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
