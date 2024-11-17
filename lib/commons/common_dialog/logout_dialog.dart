import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      width: 584,
      padding: EdgeInsets.all(25.w),
      decoration: BoxDecoration(
          color: context.whiteColor, borderRadius: BorderRadius.circular(24.r)),
      child: Scaffold(
        backgroundColor: context.whiteColor,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 44.h,
                    width: 44.h,
                    decoration: BoxDecoration(
                        color: context.lightGreyColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppAssets.closeSvgIcon),
                    ),
                  ),
                )
              ],
            ),
            Text(
              'Logout',
              style: getBoldStyle(
                  color: context.primary, fontSize: MyFonts.size22),
            ),
            padding12,
            Image.asset(AppAssets.sadIcon, width: 218, height: 218),
            Text(
              'Are you sure you want to log out? ',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size20),
            ),
            padding20,
            CustomButton(
              onPressed: () {},
              buttonText: 'Yes, Logout',
              buttonHeight: 48,
              buttonWidth: 270,
              borderRadius: 100,
            )
          ],
        ),
      ),
    );
  }
}
